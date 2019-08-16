Rails.application.routes.draw do
  root to: "products#index"
  resources :products, only: [:index, :show]
  namespace :admin do
    resources :products, only: [:new, :edit, :create, :update, :destroy]
    resources :users, only: [:index, :show, :edit, :update, :destroy] do
      resource :address, only: %i(edit update destroy)
    end
  end
  resource  :cart, only: [:show]
  devise_for :users, controllers: {sessions: "users/sessions", registrations: "users/registrations"}
  resource  :address, only: [:edit, :update] # TODO ユーザーに紐づく
  resources :orders, only: [:index, :show, :new, :create]

  post   '/add_item',    to: "cart_items#create"
  patch  '/update_item', to: "cart_items#update"
  put    '/update_item', to: "cart_items#update"
  delete '/delete_item', to: "cart_items#destroy"

end
