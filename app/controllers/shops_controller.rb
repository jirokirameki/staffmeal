class ShopsController < ApplicationController
  before_action :authenticate_shop!, except: [:index, :show, :info, :job_offer, :story]

  def index
  end

  def show
    @shop = Shop.find(params[:id])
  end
  
  def info
    @shop = Shop.find(params[:id])
  end  
  
  def job_offer
    @shop = Shop.find(params[:id])
  end
  
  def story
    @shop = Shop.find(params[:id])
  end
end