class HomeController < ApplicationController
  def index
    @tweet = Tweet.new(user_id: current_user.id)
    @tweets = Tweet.all.includes(:user).with_attached_images.order(created_at: "DESC")
  end
end
