Rails.application.routes.draw do
  root 'statics#index'
  get 'dashboard', to: 'dashboards#index'
  devise_for :users
  resources :plots
  resources :generations
  resources :plants
  resources :farms, param: :slug do 
    patch 'tutorial'
    resources :plantations
    resources :hampers do 
      resources :portions
    end
  end
end
