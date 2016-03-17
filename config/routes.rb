Rails.application.routes.draw do

  get 'statics/index'

  get 'static/index'

  get 'page/index'

  resources :farms, param: :slug do 
    resources :paniers do 
      resources :portions
    end
  end
  resources :generations
  resources :legumes
  devise_for :users
  root 'statics#index'
end
