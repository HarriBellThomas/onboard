Rails.application.routes.draw do

	#get 'hello/name', to 'houses#index'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
  root 'houses#index'

  resources :users do
  	resources :houses, only: [:show, :index]
    resources :orders, only: [:show]

  end
  
  resource :session, only: [:new, :create, :destroy]
  resources :houses 
  resources :orders

end
