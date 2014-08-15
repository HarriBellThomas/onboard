Rails.application.routes.draw do

	#get 'hello/name', to 'houses#index'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
  root 'houses#index'

  resources :users do
  	resources :houses	
  end
  
  resource :session
  resources :houses 
  resources :orders

end
