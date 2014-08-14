Rails.application.routes.draw do

  get 'users/new'

  get 'users/edit'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root 'houses#index'
  resources :houses

end
