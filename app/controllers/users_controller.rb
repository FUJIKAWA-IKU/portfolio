class UsersController < ApplicationController
  protect_from_forgery :except => [:destroy]
  before_action :authenticate_user, { only: [:index, :show, :edit, :update] }
  before_action :forbid_login_user, { only: [:new, :create, :login_form, :login] }
  before_action :ensure_current_user, { only: [:edit, :update] }

  def show
    @user = User.find_by(id: params[:id])
    @posts = @user.posts.order(created_at: :desc).page(params[:page]).per(5)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(
      name: params[:user][:name],
      email: params[:user][:email],
      password: params[:user][:password],
      image_name: "default.png"
    )
    if params[:user][:image_name]
      @user.image_name = "#{@user.name}.jpg"
      image = params[:user][:image_name]
      File.binwrite("public/user_images/#{@user.image_name}", image.read)
    end
    if @user.save
      session[:user_id] = @user.id
      redirect_to("/users/#{@user.id}")
    else
      render("users/new")
    end
  end

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    @user.name = params[:user][:name]
    @user.email = params[:user][:email]
    if params[:user][:image_name]
      @user.image_name = "#{@user.name}.jpg"
      image = params[:user][:image_name]
      File.binwrite("public/user_images/#{@user.image_name}", image.read)
    end
    if @user.save
      redirect_to("/users/#{@user.id}")
      flash[:notice] = "ユーザー情報を編集しました"
    else
      render("users/#{@user.id}/edit")
    end
  end

  def login_form
    @user = User.new
  end

  def login
    @user = User.find_by(
      email: params[:user][:email],
      password: params[:user][:password]
    )
    if @user
      session[:user_id] = @user.id
      redirect_to("/users/#{@user.id}")
      flash[:notice] = "ログインしました"
    else
      @error_message = "メールまたはパスワードが間違っています"
      @email = params[:user][:email]
      @password = params[:user][:password]
      render("users/login_form")
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to("/login")
  end

  def ensure_current_user
    if @current_user.id != params[:id].to_i
      flash[:notice] = "権限がありません"
      redirect_to("/posts")
    end
  end
end
