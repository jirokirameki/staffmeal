class StoriesController < ApplicationController
  before_action :authenticate_shop!, only: [:new, :create, :edit, :update]
  
  def show
    @story = Story.find(params[:id])
  end

  def new
    @story = Story.new
  end

  def create
    @story = current_shop.build_story(story_params)

    if params[:draft_button]
      # 下書き保存
      @story.draft = true;
      
      if @story.save
        flash[:success] = 'Story が正常に下書き保存されました'
        redirect_to story_shop_path(current_shop)
      else
        flash.now[:danger] = 'Story が下書き保存されませんでした'
        render :new
      end     
      
    else
      # 投稿
      @story.draft = false;
      
      if @story.save(context: :post)
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
    
    if params[:draft_button]
      # 下書き保存
      @story.draft = true;
      @story.attributes = story_params

      if @story.save  
        flash[:success] = 'Story は正常に下書き保存されました'
        redirect_to story_shop_path(current_shop)
      else
        flash.now[:danger] = 'Story は下書き保存されませんでした'
        render :edit
      end
    else
      # 投稿
      @story.draft = false;
      @story.attributes = story_params
    
      if @story.save(context: :post)
        flash[:success] = 'Story は正常に更新されました'
        redirect_to story_shop_path(current_shop)
      else
        flash.now[:danger] = 'Story は更新されませんでした'
        render :edit
      end
    end
  end

  private
  
  # Strong Parameter
  def story_params
    params.require(:story).permit(:title, :image, :image_cache, :origin, :recommend, :atmosphere)
  end  
end
