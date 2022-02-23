class FavoritesController < ApplicationController
  
  before_action  :require_user_logged_in
  def create
    user = Micropost.find(params[:micropost_id])
    current_user.favorite(user)
    flash[:success] = 'お気に入り登録しました。'
    redirect_back(fallback_location: users_path)
  end

  def destroy
    user = Micropost.find(params[:micropost_id])
    current_user.unfavorite(user)
    flash[:success] = 'お気に入り登録を解除しました。'
    redirect_back(fallback_location: users_path) 
  end 
end
