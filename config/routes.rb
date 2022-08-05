# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :authors do
    resources :books
  end
  # Defines the root path route ("/")
  root 'authors#index'
end
