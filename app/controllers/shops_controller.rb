class ShopsController < ApplicationController
  before_action :authenticate_shop!, except: [:show, :offer, :info]
  
  def show
    @shop = Shop.find(params[:id])
  end
  
  def offer
    @shop = Shop.find(params[:id])
  end
  
  def info
    @shop = Shop.find(params[:id])
  end
  
end
