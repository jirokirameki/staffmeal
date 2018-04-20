class LikesController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @post = Post.find(params[:post_id])
    current_user.like(@post)
    # flash[:success] = '投稿をいいね！しました。'
    
    respond_to do |format|
      format.html
      format.js
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    current_user.unlike(@post)
    # flash[:success] = '投稿のいいね！を解除しました。'
    
    respond_to do |format|
      format.html
      format.js
    end
  end
end
