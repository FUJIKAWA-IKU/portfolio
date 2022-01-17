class LikesController < ApplicationController
  def create
    @like = Like.new(
      user_id: @current_user.id,
      post_id: params[:post_id]
    )
    @like.save
    redirect_to("/posts")
  end

  def destroy
    @like = Like.find_by(
      user_id: @current_user.id,
      post_id: params[:post_id]
    )
    @like.destroy
    redirect_to("/posts")
  end

  def index
    @user = User.find_by(id: params[:user_id])
    @like_posts = @user.like_posts
  end
end
