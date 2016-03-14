Rails.application.routes.draw do
  devise_for :users
  resources :legumes
  root 'legumes#index'
end
