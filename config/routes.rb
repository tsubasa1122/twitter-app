Rails.application.routes.draw do
  get 'favorites/create'
  get 'favorites/destroy'
  root to: 'home#index'
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  resources :users, only: %i[show update] do
    resource :relationships, only: %i[create destroy]
    get :follower, on: :member
    get :follow, on: :member
  end
  resources :tweets, only: %i[create]
end
