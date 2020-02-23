Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  resources :users, only: %i[show update] do
    resource :relationships, only: %i[create destroy]
    get :followers, on: :member
    get :follows, on: :member
  end
  resources :tweets, only: %i[create]
end
