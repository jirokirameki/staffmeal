class LikesController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @post = Post.find(params[:post_id])
    current_user.like(@post)
    
    # 総いいね！数を+1
    shop = Shop.find(@post.shop_id)
    shop.total_like = shop.total_like + 1
    shop.save
    
    respond_to do |format|
      format.html
      format.js
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    current_user.unlike(@post)
    
    # 総いいね！数を-1
    shop = Shop.find(@post.shop_id)
    shop.total_like = shop.total_like - 1
    shop.save
    
    respond_to do |format|
      format.html
      format.js
    end
  end
end
