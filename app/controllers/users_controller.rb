class UsersController < ApplicationController
  before_action :set_user, only: %i[show]
  
  def show; end

  def update
    @user_profile = UserProfile.find_by(user_id: params[:id])
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
    params.require(:user_profile).permit(:name, :account_name, :description, :location, :website)
  end

  def set_user
    @user = User.find(params[:id])
    @user_profile = @user.user_profile
  end
end
