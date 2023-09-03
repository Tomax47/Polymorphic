Rails.application.routes.draw do
  devise_for :users

  resources :posts do
    resources :comments, only: [:create, :destroy]

  end

  resources :likes, only: [:create, :destroy]

  root 'home#index'

end
