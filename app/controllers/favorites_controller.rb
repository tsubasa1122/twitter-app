class FavoritesController < ApplicationController
  def create
    favorite = current_user.favorites.build(tweet_id: favorite_params[:tweet_id])
    favorite.save
    redirect_back(fallback_location: root_path)
  end

  def destroy
    favorite = Favorite.find_by(tweet_id: favorite_params[:tweet_id], user_id: current_user.id)
    favorite.destroy
    redirect_back(fallback_location: root_path)
  end

  private

  def favorite_params
    params.permit(:tweet_id)
  end
end