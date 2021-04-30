class FavoritesController < ApplicationController
  before_action :post_params

  def create
    post = Post.find(params[:post_id])
    favorite = current_member.favorites.new(post_id: post.id, favorite_id: @favorite.id)
    favorite.save
      @favorite = Favorite.find(params[:favorite_id])
      #通知の作成
      @favorite.create_notification_by(current_member)
      respond_to do |format|
        format.html {redirect_to request.referrer}
        format.js
      end
  end

  def destroy
    post = Post.find(params[:post_id])
    favorite = current_member.favorites.find_by(post_id: post.id)
    favorite.destroy

  end

  
end
