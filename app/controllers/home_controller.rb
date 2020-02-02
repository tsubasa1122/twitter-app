class HomeController < ApplicationController
  def index
    @tweet = Tweet.new(user_id: current_user.id)
  end
end
