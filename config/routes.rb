Rails.application.routes.draw do
  devise_for :users

  namespace :api do
    post '/auth/login', to: 'authentication#login'
    resources :users, only: [] do
      resources :posts, only: [:index] do
        resources :comments, only: %i[index create]
      end
    end

    resources :posts, only: [] do
      resources :comments, only: [:create]
    end
  end

  resources :users, only: %i[index show] do
    resources :posts, only: %i[index show]
  end

  resources :posts, only: [:index, :show, :new, :create, :destroy]
  resources :comments, only: [:new, :create, :destroy]

  resources :likes, only: [:create]
  root 'users#index'
end
