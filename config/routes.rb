Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :products, only: [:show, :index]
  resources :categories, only: [:show, :index]
  resources :pages, only: [:show, :index]

  get ':permalink', to: 'pages#permalink'

  root 'products#index'
end
