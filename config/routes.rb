Rails.application.routes.draw do
  root "products#index"
  devise_for :users, controllers: {sessions: "users/sessions", registrations: "users/registrations"}
  resource :cart, only: [:show] do
    # TODO: URLレビュー依頼 (rails routes | grep cart_item)
    resources :cart_items, only: [:update, :destroy]
  end
  resources :orders, only: [:index, :show, :new, :create]
  resources :products, only: [:index, :show] do
    resources :cart_items, only: [:create]
  end
  resources :users, only: [:edit, :update] do
    resource :address, only: [:edit, :update]
    resources :notes do
      resources :comments, only: [:index, :new, :edit, :create, :update, :destroy]
    end
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
