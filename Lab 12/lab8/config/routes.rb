Rails.application.routes.draw do
  root 'base#index'

  get '/results' => 'base#results'
  post '/create' => 'base#create'

  get "/users" => "user_interaction#users"
  get "/login" => "user_interaction#login"
  get "/logout" => "user_interaction#logout"
  get "/register" => "user_interaction#register"
  post "/auth" => "user_interaction#auth"
  post "/create_new_user" => "user_interaction#create_new_user"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
