Rails.application.routes.draw do
  root "products#index"
  devise_for :users, controllers: {sessions: "users/sessions", registrations: "users/registrations"}
  resources :products, only: [:index, :show]
  resource  :cart, only: [:show] do
    post   '/add_item',    to: "cart_items#create"
    patch  '/update_item', to: "cart_items#update"
    put    '/update_item', to: "cart_items#update"
    delete '/delete_item', to: "cart_items#destroy"  
  end
  resources :user, only: [:show, :edit, :update] do
    resource :address, only: [:edit, :update]
  end

  resources :orders, only: [:index, :show, :new, :create]

  namespace :admin do
    resources :products, only: [:new, :edit, :create, :update, :destroy] do
      member do
        get :move
      end
    end
    resources :users, only: [:index, :show, :edit, :update, :destroy] do
      resource :address, only: [:edit, :update]
    end
  end
end
