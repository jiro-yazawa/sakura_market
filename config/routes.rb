Rails.application.routes.draw do
  root "products#index"
  devise_for :users, controllers: {sessions: "users/sessions", registrations: "users/registrations"}
  resource :cart, only: [:show]
  resource :cart_item, only: [:create, :update, :destroy]
  resources :orders, only: [:index, :show, :new, :create]
  resources :products, only: [:index, :show]
  resource :user, only: [:edit, :update] do
    resource :address, only: [:edit, :update]
  end

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
