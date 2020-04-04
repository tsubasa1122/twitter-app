class UsersController < ApplicationController
  before_action :set_user, only: %i[show update]
  before_action :set_search_tweet, only: %i[show follow follower]
  
  def show
    @tweets = Tweet.where(user_id: params[:id]).preload(:user).order(created_at: "DESC").with_attached_images
    @follow_users_count = @user.active_relationships.count
    @follower_users_count = @user.passive_relationships.count
    @search = Tweet.search(params[:q])
  end

  def update
    if @user_profile.update(user_profile_params)
      flash[:notice] = "ユーザー情報を更新しました。"
      redirect_to user_path(@user_profile.user_id)
    else
      flash[:alert] = "更新に失敗しました。"
      render :show
    end
  end

  def follow
    user = User.find(params[:id])
    @users = user.followings
  end

  def follower
    user = User.find(params[:id])
    @users = user.followers
  end

  private

  def user_profile_params
    params.require(:user_profile).permit(:name, :account_name, :description, :location, :website, :profile_image)
  end

  def set_user
    @user = User.find(params[:id])
    @user_profile = @user.user_profile
    @tweet = Tweet.new(user_id: current_user.id)
  end

  def set_search_tweet
    @search = Tweet.search(params[:q])
  end
end
