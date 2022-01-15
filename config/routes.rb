Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "home#top"
  resources :users
  resources :posts do
    resources :comments, only: [:new, :create, :destroy]
  end

  get "login", to:"users#login_form"
  post "login", to:"users#login"
  get "logout", to:"users#logout"

  post "likes/:post_id/create", to: "likes#create"
  delete "likes/:post_id/destroy", to: "likes#destroy"

  get "records/new", to:"records#new"
  post "records/create", to:"records#create"
  get "records/index/:user_id", to:"records#index"
  get "trainings/new", to:"trainings#new"
  post "trainings/create", to:"trainings#create"
  
end
