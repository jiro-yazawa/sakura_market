Rails.application.routes.draw do
  devise_for :users, controllers: {sessions: "users/sessions"}
  root to: "items#index"
  resources :items, only: [:show, :new, :create, :destroy]
end
