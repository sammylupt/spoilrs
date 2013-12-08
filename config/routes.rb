SpoilrsRails::Application.routes.draw do

  root 'static#index'
  get "new" => "posts#new", :as => 'new_post'
  get ":id/replies/new" => "posts#reply", :as => 'new_reply'
  get ':id' => "posts#show", :as => 'post'
  post 'posts' => "posts#create", :as => 'posts'

  get "/auth/twitter/callback" => "sessions#create"
  get "/logout" => "sessions#destroy"

  get "sessions/new"
end
