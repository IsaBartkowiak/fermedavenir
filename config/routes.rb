Rails.application.routes.draw do

  get 'statics/index'

  get 'static/index'

  get 'page/index'
  get '/generate_paniers' => 'paniers#generate'

  resources :paniers do 
  	resources :portions
  end
  resources :generations
  resources :legumes
  devise_for :users
  root 'statics#index'
end
