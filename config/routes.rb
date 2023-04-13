Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  get 'generate', to:'code_generator#index'
  post 'generate', to: 'code_generator#generate'

end
