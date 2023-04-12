Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "test_cases#show"
  post 'test_cases/generate', to: 'test_cases#generate', as: 'generate_test_cases'

end
