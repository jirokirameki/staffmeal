Rails.application.routes.draw do
  devise_for :shops, module: :shops
  resources :shops, only: [:show] do
    member do
      get :offer
      get :info
    end
  end
  # root to: 'toppages#index'
  root to: 'posts#index'  
  resources :posts
end
