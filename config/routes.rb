Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "start#index"
  resources :users
  resources :posts
  # resources :comments
  resources :posts do
    resources :comments
  end
  
end
