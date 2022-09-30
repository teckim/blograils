Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index, :show]
  end
  resources :posts, only: [:index, :show, :new, :create, :destroy]
  resources :comments, only: [:new, :create]
  resources :likes, only: [:create]
  root "users#index"
end
