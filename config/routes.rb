Rails.application.routes.draw do

  get 'home/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"
  #email template
  resources :emails, only: %i[new create]
  get "/show_response", to: "emails#show_response"
  
  post 'open_ai_code_analysis/generate_test_cases', to: 'open_ai_code_analysis#generate_test_cases', as: 'generate_test_cases'
  get 'test_cases', to: 'open_ai_code_analysis#test_cases', as: 'test_cases'
end
