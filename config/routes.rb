Rails.application.routes.draw do
  devise_for :users
  root to: "meows#index"

  resources :meows, only: [:show, :new, :create]
  resources :payments, only: [:new, :create]
end
