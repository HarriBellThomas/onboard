Rails.application.routes.draw do

  get 'sessions/new'

	#get 'hello/name', to 'houses#index'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root 'houses#index'
  resources :houses
  resources :users do
  	resource :session
  end

end
