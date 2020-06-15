Rails.application.routes.draw do

  # users could sign up multiple times
  resources :users
  # user can only make 1 session
  resource :session

  get "about", to: "pages#about"

  root "pages#home"


end
