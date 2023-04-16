Rails.application.routes.draw do
  get 'home/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"
  post 'open_ai_code_analysis/generate_test_cases', to: 'open_ai_code_analysis#generate_test_cases', as: 'generate_test_cases'
  get 'test_cases', to: 'open_ai_code_analysis#test_cases', as: 'test_cases'
  get 'open_ai_code_analysis/generate_code_docs', to: 'open_ai_code_analysis#code_docs'
  post 'open_ai_code_analysis/generate_code_docs', to: 'open_ai_code_analysis#generate_code_docs'
end
