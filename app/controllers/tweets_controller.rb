class TweetsController < ApplicationController

  def search
    @search = Tweet.ransack(params[:q])
    @tweets = @search.result.user_detail.with_attached_images.order(created_at: "DESC")
  end

  def create
    @tweet = Tweet.new(tweet_params)
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
    params.require(:tweet).permit(:content, images: []).merge(user_id: current_user.id)
  end
end
