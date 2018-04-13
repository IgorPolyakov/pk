# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    resources :users
    resources :tasks
    resources :auth, only: :create
  end
end
