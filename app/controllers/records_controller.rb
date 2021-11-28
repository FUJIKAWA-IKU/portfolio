class RecordsController < ApplicationController
  require "date"

  def new
    @record = Record.new
  end

  def create
    f = Date.new(
      params[:record]["runday(1i)"].to_i,
      params[:record]["runday(2i)"].to_i,
      params[:record]["runday(3i)"].to_i
    )
    if Record.find_by(user_id: @current_user.id, runday: "#{f}")
      @record = Record.find_by(user_id: @current_user.id, runday: "#{f}")
      @record.distance = params[:record][:distance]
      @record.time = params[:record][:time]
      if @record.save
        redirect_to("/records/index/#{@current_user.id}")
        flash[:notice] = "記録しました"
      else
        render("records/new")
      end
    else
      @record = Record.new(
        user_id: @current_user.id,
        runday: "#{f}",
        distance: params[:record][:distance],
        time: params[:record][:time]
      )
      if @record.save
        redirect_to("/records/index/#{@current_user.id}")
        flash[:notice] = "記録しました"
      else
        render("records/new")
      end
    end
  end

  def index
    @today = Date.today
    @monday = @today.monday
    @base_days = [@monday, @monday + 1.day, @monday + 2.day, @monday + 3.day, @monday + 4.day, @monday + 5.day, @monday + 6.day]

    ###################################################
    # 一週間分のランニングデータについて

    @weekly_records = Record.where(
      user_id: params[:user_id],
      runday: @today.all_week
    ).order(runday: "ASC")

    if @weekly_records != 7
      @hanuke = @base_days - @weekly_records.pluck(:runday)

      if @hanuke.count == 1
        @newrecord = Record.new(
          user_id: params[:user_id],
          runday: "#{@hanuke}",
          distance: 0,
          time: 0
        )
        @newrecord.save
      else
        @hanuke.each do |ha|
          @newrecord = Record.new(
            user_id: params[:user_id],
            runday: ha,
            distance: 0,
            time: 0
          )
          @newrecord.save
        end
      end
    end

    gon.weekly_records_distance = @weekly_records.pluck(:distance)
    gon.weekly_records_time = @weekly_records.pluck(:time)
    gon.weekly_records_time_sum = @weekly_records.sum(:time)

    ###################################################
    # 一週間分の筋トレデータについて

    @weekly_trainings = Training.where(
      user_id: params[:user_id],
      trainingday: @today.all_week
    ).order(trainingday: "ASC")

    @hanuke_asi = @base_days - @weekly_trainings.where(parts: "足").pluck(:trainingday)
    if @hanuke_asi.count == 1
      @newrecord_asi = Training.new(
        user_id: params[:user_id],
        trainingday: "#{@hanuke_asi}",
        time: 0,
        parts: "足"
      )
      @newrecord_asi.save
    elsif @hanuke_asi.count >= 2
      @hanuke_asi.each do |ha|
        @newrecord_asi = Training.new(
          user_id: params[:user_id],
          trainingday: ha,
          time: 0,
          parts: "足"
        )
        @newrecord_asi.save
      end
    end

    @hanuke_se = @base_days - @weekly_trainings.where(parts: "背中").pluck(:trainingday)
    if @hanuke_se.count == 1
      @newrecord_se = Training.new(
        user_id: params[:user_id],
        trainingday: "#{@hanuke_se}",
        time: 0,
        parts: "背中"
      )
      @newrecord_se.save
    elsif @hanuke_se.count >= 2
      @hanuke_se.each do |ha|
        @newrecord_se = Training.new(
          user_id: params[:user_id],
          trainingday: ha,
          time: 0,
          parts: "背中"
        )
        @newrecord_se.save
      end
    end

    @hanuke_ude = @base_days - @weekly_trainings.where(parts: "腕").pluck(:trainingday)
    if @hanuke_ude.count == 1
      @newrecord_ude = Training.new(
        user_id: params[:user_id],
        trainingday: "#{@hanuke_ude}",
        time: 0,
        parts: "腕"
      )
      @newrecord_ude.save
    elsif @hanuke_ude.count >= 2
      @hanuke_ude.each do |ha|
        @newrecord_ude = Training.new(
          user_id: params[:user_id],
          trainingday: ha,
          time: 0,
          parts: "腕"
        )
        @newrecord_ude.save
      end
    end

    @hanuke_oshiri = @base_days - @weekly_trainings.where(parts: "お尻").pluck(:trainingday)
    if @hanuke_oshiri.count == 1
      @newrecord_oshiri = Training.new(
        user_id: params[:user_id],
        trainingday: "#{@hanuke_oshiri}",
        time: 0,
        parts: "お尻"
      )
      @newrecord_oshiri.save
    elsif @hanuke_oshiri.count >= 2
      @hanuke_oshiri.each do |ha|
        @newrecord_oshiri = Training.new(
          user_id: params[:user_id],
          trainingday: ha,
          time: 0,
          parts: "お尻"
        )
        @newrecord_oshiri.save
      end
    end

    @hanuke_mune = @base_days - @weekly_trainings.where(parts: "胸").pluck(:trainingday)
    if @hanuke_mune.count == 1
      @newrecord_mune = Training.new(
        user_id: params[:user_id],
        trainingday: "#{@hanuke_mune}",
        time: 0,
        parts: "胸"
      )
      @newrecord_mune.save
    elsif @hanuke_mune.count >= 2
      @hanuke_mune.each do |ha|
        @newrecord_mune = Training.new(
          user_id: params[:user_id],
          trainingday: ha,
          time: 0,
          parts: "胸"
        )
        @newrecord_mune.save
      end
    end

    # 積立棒グラフ
    gon.weekly_trainings_asi = @weekly_trainings.where(parts: "足").pluck(:time)
    gon.weekly_trainings_se = @weekly_trainings.where(parts: "背中").pluck(:time)
    gon.weekly_trainings_ude = @weekly_trainings.where(parts: "腕").pluck(:time)
    gon.weekly_trainings_oshiri = @weekly_trainings.where(parts: "お尻").pluck(:time)
    gon.weekly_trainings_mune = @weekly_trainings.where(parts: "胸").pluck(:time)

    # 円グラフ
    gon.weekly_trainings_asi_sum = @weekly_trainings.where(parts: "足").sum(:time)
    gon.weekly_trainings_senaka_sum = @weekly_trainings.where(parts: "背中").sum(:time)
    gon.weekly_trainings_ude_sum = @weekly_trainings.where(parts: "腕").sum(:time)
    gon.weekly_trainings_oshiri_sum = @weekly_trainings.where(parts: "お尻").sum(:time)
    gon.weekly_trainings_mune_sum = @weekly_trainings.where(parts: "胸").sum(:time)
  end
end
