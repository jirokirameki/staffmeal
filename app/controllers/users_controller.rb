class UsersController < ApplicationController
  before_action :authenticate_user!#, except: [:index, :show, :shop_info, :offer, :company_info]  
  def show
    @user = User.find(params[:id])    
  end
end
