Rails.application.routes.draw do
  get 'home/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  get 'generate', to:'code_generator#index'
  post 'generate', to: 'code_generator#generate'

  root "home#index"
  post 'open_ai_code_analysis/generate_test_cases', to: 'open_ai_code_analysis#generate_test_cases', as: 'generate_test_cases'
  get 'test_cases', to: 'open_ai_code_analysis#test_cases', as: 'test_cases'
end
