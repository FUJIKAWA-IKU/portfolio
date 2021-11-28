class TrainingsController < ApplicationController
  require "date"

  def new
    @training = Training.new
  end

  def create
    f = Date.new(
      params[:training]["trainingday(1i)"].to_i,
      params[:training]["trainingday(2i)"].to_i,
      params[:training]["trainingday(3i)"].to_i
    )
    if Training.find_by(
      user_id: @current_user.id,
      trainingday: "#{f}",
      parts: "#{params[:training][:parts]}"
    )
      @training = Training.find_by(
        user_id: @current_user.id,
        trainingday: "#{f}",
        parts: "#{params[:training][:parts]}"
      )
      @training.time = params[:training][:time]
      if @training.save
        redirect_to("/records/index/#{@current_user.id}")
        flash[:notice] = "記録しました"
      else
        render("trainings/new")
      end
    else
      @training = Training.new(
        user_id: @current_user.id,
        trainingday: "#{f}",
        parts: "#{params[:training][:parts]}",
        time: params[:training][:time]
      )
      if @training.save
        redirect_to("/records/index/#{@current_user.id}")
        flash[:notice] = "記録しました"
      else
        render("trainings/new")
      end
    end
  end
end
