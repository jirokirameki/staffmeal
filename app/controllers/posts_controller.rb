class PostsController < ApplicationController
  before_action :authenticate_shop!, only: [:new, :create, :edit, :update, :destroy]
  
  def index
    @posts = Post.all.order('created_at DESC')
    # @posts = Post.includes(:like).order('likes.user_id DESC')
    # binding.pry
    # rank
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    # binding.pry
    
    @post = current_shop.posts.build(post_params)

    if @post.save
      flash[:success] = 'Post が正常に投稿されました'
      redirect_to @post
    else
      flash.now[:danger] = 'Post が投稿されませんでした'
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      flash[:success] = 'Post は正常に更新されました'
      redirect_to @post
    else
      flash.now[:danger] = 'Post は更新されませんでした'
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    flash[:success] = 'Post は正常に削除されました'
    redirect_to posts_url
  end
  
  private
  
  # def rank
  #   @rank = Post.find(Like.group(:post_id).order('count(post_id) desc').pluck(:post_id))
  # end  

  # Strong Parameter
  def post_params
    params.require(:post).permit(
      :comment,
      :image, 
      :image_cache, 
      :remove_image 
      )
  end    
end
