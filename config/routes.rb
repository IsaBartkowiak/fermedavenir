Rails.application.routes.draw do

  get 'statics/index'

  get 'static/index'

  get 'page/index'

  resources :paniers do 
  	resources :portions
  end
  resources :generations
  resources :legumes
  devise_for :users
  root 'statics#index'
end
