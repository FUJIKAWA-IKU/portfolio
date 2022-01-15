class CommentsController < ApplicationController

  def new
    @post = Post.find_by(id: params[:post_id])
    @comment = Comment.new
  end

  def create
    @post = Post.find_by(id: params[:post_id])
    @comment = Comment.new(
      body: params[:comment][:body],
      user_id: @current_user.id,
      post_id: params[:post_id]
    )
    if @comment.save
      redirect_to post_path(@post)
      flash[:notice] = "コメントを作成しました"
    else
      render new_post_comment_path(@post, @comment)
    end
  end

  def destroy
    @comment = Comment.find_by(
      user_id: @current_user.id,
      post_id: params[:post_id]
    )
    @comment.destroy
    redirect_to post_path(@post)
    flash[:notice] = "コメントを削除しました"
  end
end