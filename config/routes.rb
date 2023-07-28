# frozen_string_literal: true

Rails.application.routes.draw do
  root 'users#index'

  resources :users, only: [:show] do
    resources :posts, only: [:index, :show, :new, :create] do
      resources :comments, only: [:new, :create]
      resource :like, only: [:create, :destroy], controller: 'likes'
    end
  end
end
