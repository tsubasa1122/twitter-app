class HomeController < ApplicationController
  def index
    @tweet = Tweet.new(user_id: current_user.id)
    @tweets = Tweet.includes(user: [user_profile: :profile_image_attachment]).with_attached_images.all.order(created_at: "DESC")
  end
end
