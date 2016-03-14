Rails.application.routes.draw do
  resources :legumes
  devise_for :users
  root 'legumes#index'
end
