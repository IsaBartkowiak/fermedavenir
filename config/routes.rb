Rails.application.routes.draw do

  root 'statics#index'

  get 'dashboard', to: 'dashboards#index'

  
  resources :parcelles
  resources :generations
  resources :legumes

  resources :farms, param: :slug, :path => '/' do 
    resources :plantations
    resources :paniers do 
      resources :portions
    end
  end
  devise_for :users
end
