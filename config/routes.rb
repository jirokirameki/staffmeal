Rails.application.routes.draw do
  devise_for :users, module: :users
  resources :users, only: [:show]  
  
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
end
