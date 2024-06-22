# frozen_string_literal: true

Rails.application.routes.draw do
  get 'up' => 'rails/health#show', as: :rails_health_check

  get 'sign_in', to: 'sessions#new'
  post 'sign_in', to: 'sessions#create'
  delete 'sign_out', to: 'sessions#destroy'

  resources :users, only: %i[index create destroy show] do
    member do
      get :resend_invitation
      post :fin
    end
  end
  resource :invitation, only: %i[show update]
  resource :home, only: :show
  resource :ranking, only: :show
  resources :comments, only: :create
  resources :matches, except: %i[create destroy new] do
    member do
      post :set_type
    end
  end
  resources :notifications, only: :index do
    member do
      patch :display
    end
  end

  root to: 'homes#show'
end
