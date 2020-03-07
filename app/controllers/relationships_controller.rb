class RelationshipsController < ApplicationController

  def create
    @follow = current_user.active_relationships.build(followed_id: params[:user_id])
    if @follow.save
      flash[:notice] = "フォローしました"
      redirect_to user_path(params[:user_id])
    else
      flash[:alert] = "失敗しました"
      render template: "users/show"
    end
  end

  def destroy
    @follow = current_user.active_relationships.find_by(followed_id: params[:user_id])
    if @follow.destroy
      flash[:notice] = "フォローを解除しました"
      redirect_to user_path(params[:user_id])
    else
      flash[:alert] = "失敗しました"
      render template: "users/show"
    end
  end
end