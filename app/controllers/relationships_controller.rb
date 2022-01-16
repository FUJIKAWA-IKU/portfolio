class RelationshipsController < ApplicationController
  def create
    @user = User.find_by(id: params[:user_id])
    @follow = @current_user.active_relationships.new(
      follower_id: params[:user_id]
    )
    @follow.save
    redirect_to user_path(@user.id)
    flash[:notice] = "フォローしました"
  end

  def destroy
    @user = User.find_by(id: params[:user_id])
    @follow = @current_user.active_relationships.find_by(
      follower_id: params[:user_id]
    )
    @follow.destroy
    redirect_to user_path(@user.id)
    flash[:notice] = "フォローを解除しました"
  end
end
