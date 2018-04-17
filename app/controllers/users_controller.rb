class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:show]

  def show
    @user = User.find(params[:id])    
  end
  
  def likes
    @user = User.find(params[:id])
    @likes = @user.likes#.page(params[:page])
    #counts(@user)
  end  
end
