Rails.application.routes.draw do
  devise_for :users

  resources :events, only: [:index, :new, :show, :create]
  resources :users, only: [:show]

  resources :events do
    resources :attendances
  end

  root to: 'events#index'

  scope '/checkout' do
    post 'create', to: 'checkout#create', as: 'checkout_create'
    get 'success', to: 'checkout#success', as: 'checkout_success'
    get 'cancel', to: 'checkout#cancel', as: 'checkout_cancel'
  end

end
