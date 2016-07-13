Rails.application.routes.draw do
  root 'statics#index'
  get 'dashboard', to: 'dashboards#index'
  devise_for :users
  resources :parcelles
  resources :generations
  resources :legumes
  resources :farms, param: :slug do 
    patch 'tutorial'
    resources :plantations
    resources :paniers do 
      resources :portions
    end
  end
end
