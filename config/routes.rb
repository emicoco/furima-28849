Rails.application.routes.draw do
  get 'articles/index'
  get 'articles/new'
  devise_for :users
  root to: "items#index"
  resources :items do
    resources :orders, only: [:create, :index]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end