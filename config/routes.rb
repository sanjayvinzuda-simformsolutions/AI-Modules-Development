Rails.application.routes.draw do
  get 'home/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"
  post 'test_cases/generate', to: 'test_cases#generate', as: 'generate_test_cases'
  get 'test_cases', to: 'test_cases#index', as: 'test_cases'
end
