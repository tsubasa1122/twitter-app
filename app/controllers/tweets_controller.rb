class TweetsController < ApplicationController

  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.user_id = params[:user_id]
    binding.pry
    if @tweet.save
      flash[:notice] = "Tweetが投稿されました。"
      redirect_to root_path
    else
      flash[:alert] = "Tweetの投稿に失敗しました。"
      render "home/index"
    end
  end

  private

  def tweet_params
    params.require(:tweet).permit(:user_id, :content)
  end
end
