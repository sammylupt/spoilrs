SpoilrsRails::Application.routes.draw do

  root 'static#index'
  get "/auth/twitter/callback" => "sessions#create"
  get "/logout" => "sessions#destroy"

  get "sessions/new"
  resources :posts
  resources :users
end
