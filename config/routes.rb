Rails.application.routes.draw do
  get 'users/show'
  devise_for :users
  resources :events, only: [:index, :new, :show, :create]
  root to: 'events#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
