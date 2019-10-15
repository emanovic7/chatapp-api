Rails.application.routes.draw do

  get '/profile', to: "users#profile"
  post '/login', to: "auth#login"
  post '/signup', to: "users#create"
  
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
