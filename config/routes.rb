Rails.application.routes.draw do
  get 'articles/index'
  get 'articles/new'
  devise_for :users
  root to: "items#index"
  resources :items

  root to: 'orders#index'
  resources :orders, only:[:create]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end