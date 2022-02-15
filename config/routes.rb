Rails.application.routes.draw do
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root 'match#home'
  get 'do_something', to: 'match#do_something'
  # Defines the root path route ("/")
  # root "articles#index"
end
