Rails.application.routes.draw do
  root to: "meows#index"

  resources :meows, only: [:show, :new, :create]
end
