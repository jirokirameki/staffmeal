class StoriesController < ApplicationController
  before_action :authenticate_shop!, only: [:new, :create, :edit, :update, :destroy]
  
  def show
    @story = Story.find(params[:id])
  end

  def new
    @story = Story.new
  end

  def create
    # binding.pry    
    
    # @story = Story.new(story_params)
    # @story = current_shop.story.build(story_params)
    @story = current_shop.build_story(story_params)
    
    if params[:draft_button]
      # 下書き保存
      @story.draft = true;
      
      if @story.save(validate: false)
        flash[:success] = 'Story が正常に下書き保存されました'
        redirect_to story_shop_path(current_shop)
      else
        flash.now[:danger] = 'Story が下書き保存されませんでした'
        render :new
      end     
      
    else
      # 投稿
      @story.draft = false;
      
      if @story.save
        flash[:success] = 'Story が正常に投稿されました'
        redirect_to story_shop_path(current_shop)
      else
        flash.now[:danger] = 'Story が投稿されませんでした'
        render :new
      end        
      
    end
  end

  def edit
    @story = Story.find(params[:id])
  end

  def update
    @story = Story.find(params[:id])
    
    # binding.pry 

    if @story.update(story_params)
      flash[:success] = 'Story は正常に更新されました'
      redirect_to story_shop_path(current_shop)
    else
      flash.now[:danger] = 'Story は更新されませんでした'
      render :edit
    end    
  end

  def destroy
    # @story = Story.find(params[:id])
    # @story = current_shop.story
    # @story.destroy
    current_shop.story = nil

    flash[:success] = 'Story は正常に削除されました'
    redirect_to story_shop_path(current_shop)
  end
  
  private  

  # Strong Parameter
  def story_params
    params.require(:story).permit(:title, :image, :image_cache, :origin, :recommend, :atmosphere)
  end  
end
