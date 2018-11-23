Rails.application.routes.draw do
  get 'profile/index'
  get 'profile/create'
  get 'profile/update'
  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Cart Modifications
  get 'cart/add_to_cart', to: "cart#addToCart"
  get 'cart/remove_from_cart', to: "cart#removeFromCart"
  get 'checkout' , to:"cart#checkout"

  # My Profile
  get 'profile/create', to: "profile#create"
  get 'profile/index', to: "profile#index"
  get 'profile/update', to: "profile#update"

  #Orders
  get 'order/add_order', to: 'order#add_order'


  resources :products, only: [:show, :index]
  resources :categories, only: [:show, :index]
  resources :pages, only: [:show, :index]
  resources :search, only: [:index] do
    collection do
      get 'results'
    end
  end
  resources :cart, only: [:index]


  get ':permalink', to: 'pages#permalink'

  root 'products#index'
end
