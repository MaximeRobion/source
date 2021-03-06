Rails.application.routes.draw do

  #active admin urls
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  #categories controller
  resources :categories

  #items controllers
  resources :items

  # users could sign up multiple times
  resources :users
  # user can only make 1 session
  resource :session

  get "about", to: "pages#about"

  root "pages#home"


end
