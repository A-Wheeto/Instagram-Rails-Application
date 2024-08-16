Rails.application.routes.draw do
  resources :posts
  devise_for :users
    
  resources :comments, only: [:create, :destroy]
  resources :users, only: [:show, :index]

  root "home#index"

  post "toggle_like", to: "likes#toggle_like", as: :toggle_like
end
