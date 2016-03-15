Rails.application.routes.draw do

  resources :paniers do 
  	resources :portions
  end
  resources :generations
  resources :legumes
  devise_for :users
  root 'generations#index'
end
