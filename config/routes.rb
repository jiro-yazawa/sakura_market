Rails.application.routes.draw do
  devise_for :users, controllers: {sessions: "users/sessions", registrations: "users/registrations"}
  root to: "items#index"
  resources :items, only: [:index, :show, :new, :create, :destroy]
  resource  :cart, only: [:show]
  resource  :user do
    resource :address, only: [:edit, :update]
  end
  resource :purchase, only:[:create] do
    get 'confirm', action: :confirm
  end

  post   '/add_item',    to: "cart_items#create"
  post   '/update_item', to: "cart_items#update"
  delete '/delete_item', to: "cart_items#destroy"

end
