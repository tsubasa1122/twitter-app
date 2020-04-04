Rails.application.routes.draw do
  root to: 'home#index'
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  resources :users, only: %i[show update] do
    resource :relationships, only: %i[create destroy]
    get :follower, on: :member
    get :follow, on: :member
  end
  resources :tweets, only: %i[create] do
    get :search, to: 'tweets#search', on: :collection
    resource :favorites, only: %i[create destroy]
  end
end
