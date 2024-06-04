# frozen_string_literal: true

Rails.application.routes.draw do
  get 'up' => 'rails/health#show', as: :rails_health_check

  get 'sign_in', to: 'sessions#new'
  post 'sign_in', to: 'sessions#create'
  delete 'sign_out', to: 'sessions#destroy'

  resources :users, only: %i[index create destroy] do
    member do
      get :resend_invitation
      get :fin
      get :fin_revoke
    end
  end
  resource :invitation, only: %i[show update]
  resource :home, only: :show
  resource :ranking, only: :show
  resources :comments, only: :create
  resources :matches, except: %i[create destroy new] do
    get :set_type, on: :member
  end
  resources :notifications, only: :index do
    member do
      patch :display
    end
  end

  root to: 'homes#show'
end
