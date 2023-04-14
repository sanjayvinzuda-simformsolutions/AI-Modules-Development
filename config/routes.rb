Rails.application.routes.draw do
  root to: "emails#new"
  resources :emails, only: %i[new create]
  get "/show_response", to: "emails#show_response"
end
