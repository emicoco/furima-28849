Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"

  # ログアウト
  devise_scope :social_account do
    get 'sign_out', to: "sessions#destroy"
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end