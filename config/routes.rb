Rails.application.routes.draw do
  devise_for :shops, module: :shops
  resources :shops, only: [:show]
  
  root to: 'toppages#index'
end
