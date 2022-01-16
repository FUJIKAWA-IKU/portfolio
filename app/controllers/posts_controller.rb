class PostsController < ApplicationController
  before_action :ensure_correct_user, { only: [:edit, :update, :destroy] }

  def index
    @posts = Post.all.order(created_at: :desc).page(params[:page]).per(5)
  end

  def new
    @post = Post.new
  end
  
  def show
    @post = Post.find_by(id: params[:id])
    @comment = Comment.new
    @comments = Comment.where(post_id: params[:id])
  end

  def create
    @post = Post.new(
      content: params[:post][:content],
      user_id: @current_user.id
    )
    if @post.save
      redirect_to("/posts")
      flash[:notice] = "投稿を作成しました"
    else
      render("posts/new")
    end
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def update
    @post = Post.find_by(id: params[:id])
    @post.content = params[:post][:content]
    if @post.save
      redirect_to("/posts")
      flash[:notice] = "投稿を編集しました"
    else
      render("posts/edit")
    end
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    redirect_to("/posts")
    flash[:notice] = "削除しました"
  end

  def ensure_correct_user
    @post = Post.find_by(id: params[:id])
    if @post.user_id != @current_user.id
      flash[:notice] = "権限がありません"
      redirect_to("/posts")
    end
  end
end
