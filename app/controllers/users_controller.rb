class UsersController < ApplicationController
  before_action :set_user, only: %i[show update]
  
  def show
    @tweets = Tweet.where(user_id: params[:id]).includes(:user).order(created_at: "DESC")
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

  private

  def user_profile_params
    params.require(:user_profile).permit(:name, :account_name, :description, :location, :website, :profile_image)
  end

  def set_user
    @user = User.find(params[:id])
    @user_profile = @user.user_profile
    @tweet = Tweet.new(user_id: current_user.id)
  end
end
