Rails.application.routes.draw do
  devise_for :users, module: :users, 
    path_names: { sign_in: "login", sign_out: "logout"}, 
    controllers: { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :users, only: [:show] do
    member do
      get :likes
    end
  end   
  
  devise_for :shops, module: :shops
  resources :shops, only: [:show] do
    member do
      get :info
      get :job_offer
      get :story
    end
  end
  resources :shops, only: [:index]
  
  root to: 'posts#index'  
  resources :posts
  
  resources :likes, only: [:create, :destroy]
  
  resources :stories, only: [:show, :new, :create, :edit, :update]
  resources :job_offers, only: [:show, :new, :create, :edit, :update]
end
