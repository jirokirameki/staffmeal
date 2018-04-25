class JobOffersController < ApplicationController
  before_action :authenticate_shop!, only: [:new, :create, :edit, :update]
  
  def show
    @job_offer = JobOffer.find(params[:id])
  end

  def new
    @job_offer = JobOffer.new
  end

  def create
    @job_offer = current_shop.build_job_offer(job_offer_params)
    
    if params[:draft_button]
      # 下書き保存
      @job_offer.draft = true;
      
      if @job_offer.save
        flash[:success] = 'JobOffer が正常に下書き保存されました'
        redirect_to job_offer_shop_path(current_shop)
      else
        flash.now[:danger] = 'JobOffer が下書き保存されませんでした'
        render :new
      end     
      
    else
      # 投稿
      @job_offer.draft = false;
      
      if @job_offer.save(context: :post)
        flash[:success] = 'JobOffer が正常に投稿されました'
        redirect_to job_offer_shop_path(current_shop)
      else
        flash.now[:danger] = 'JobOffer が投稿されませんでした'
        render :new
      end        
      
    end
  end

  def edit
    @job_offer = JobOffer.find(params[:id])
  end

  def update
    @job_offer = JobOffer.find(params[:id])

    if params[:draft_button]
      # 下書き保存
      @job_offer.draft = true;
      @job_offer.attributes = job_offer_params

      if @job_offer.save
        flash[:success] = 'JobOffer は正常に下書き保存されました'
        redirect_to job_offer_shop_path(current_shop)
      else
        flash.now[:danger] = 'JobOffer は下書き保存されませんでした'
        render :edit
      end
    else
      # 投稿
      @job_offer.draft = false;
      @job_offer.attributes = job_offer_params
    
      if @job_offer.save(context: :post)
        flash[:success] = 'JobOffer は正常に更新されました'
        redirect_to job_offer_shop_path(current_shop)
      else
        flash.now[:danger] = 'JobOffer は更新されませんでした'
        render :edit
      end
    end
  end
  
  private  

  # Strong Parameter
  def job_offer_params
    params.require(:job_offer).permit(:title, :image, :image_cache, :makanai,
    :what, :team, :want, :permanent_staff, :temporary_staff, :arbeit, :part_time_job,
    :allowance, :working_hours, :url, :other)
  end    
end
