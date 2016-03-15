Rails.application.routes.draw do
  resources :generations
  resources :legumes
  devise_for :users
  root 'generations#index'
end
