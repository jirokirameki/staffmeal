Rails.application.routes.draw do
  
  # root to: 'toppages#index' 
  
  devise_for :users, module: :users
  resources :users, only: [:show] do
    member do
      get :likes
    end
  end   
  
  devise_for :shops, module: :shops
  resources :shops, only: [:show] do
    member do
      get :shop_info
      get :offer
      get :company_info
    end
  end
  resources :shops, only: [:index]
  
  root to: 'posts#index'  
  resources :posts
  
  resources :likes, only: [:create, :destroy]
end
