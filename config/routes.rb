Rails.application.routes.draw do
  resources :paniers
  resources :portions
  resources :generations
  resources :legumes
  devise_for :users
  root 'generations#index'
end
