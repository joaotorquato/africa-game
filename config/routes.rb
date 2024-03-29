# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  root 'home#index'
  resources :home, only: %i[index]
  delete :reset_game, to: 'home#reset_game'

  resources :games, only: :create
  resources :teams, only: %i[index create]
  resources :words, only: %i[new create]
  resources :steps, only: %i[edit show update]
  get '/scoreboard', to: 'home#scoreboard'
end
