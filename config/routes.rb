Rails.application.routes.draw do

  get 'home/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"
  #email template
  resources :emails, only: %i[new create]
  get "/show_response", to: "emails#show_response"
  
  post 'test_cases', to: 'open_ai_code_analysis#generate_test_cases', as: 'generate_test_cases'
  get 'test_cases', to: 'open_ai_code_analysis#test_cases', as: 'test_cases'
  get 'generate_code_docs', to: 'open_ai_code_analysis#code_docs'
  post 'generate_code_docs', to: 'open_ai_code_analysis#generate_code_docs'
  post 'code_generator', to: 'open_ai_code_analysis#generate_code', as: 'generate_code'
  get 'code_generator', to: 'open_ai_code_analysis#code_generator', as: 'code_generator'
end
