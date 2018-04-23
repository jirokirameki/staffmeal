class ShopsController < ApplicationController
  before_action :authenticate_shop!, except: [:index, :show, :info, :job_offer, :story]
  # before_save :geocode_full_address

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

  # def geocode_full_address
  #   coords = Geocoder.coordinates(
  #     self.prefecture + self.city + self.address # 県名 + 市町村名 + 丁目番地
  #   )
  #   self.latitude = coords[0]
  #   self.longitude = coords[1]
  # end
end