class ShopsController < ApplicationController
  before_action :authenticate_shop!, except: [:index, :show, :shop_info, :offer, :company_info]
  # before_save :geocode_full_address

  def index
  end

  def show
    @shop = Shop.find(params[:id])
  end
  
  def shop_info
    @shop = Shop.find(params[:id])
  end  
  
  def offer
    @shop = Shop.find(params[:id])
  end
  
  def company_info
    @shop = Shop.find(params[:id])
  end

  # def geocode_full_address
  #   coords = Geocoder.coordinates(
  #     self.prefecture + self.city + self.address # 県名 + 市町村名 + 丁目番地
  #   )
  #   self.latitude = coords[0]
  #   self.longitude = coords[1]
  # end
end