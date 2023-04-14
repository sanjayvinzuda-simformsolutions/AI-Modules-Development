Rails.application.routes.draw do

  get 'home/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"
  
  resources :emails, only: %i[new create]
  get "/show_response", to: "emails#show_response"
end
