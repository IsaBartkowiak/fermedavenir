Rails.application.routes.draw do

  get 'statics/index'

  get 'static/index'

  get 'page/index'
  root 'statics#index'
  
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
