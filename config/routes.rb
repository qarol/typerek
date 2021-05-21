Rails.application.routes.draw do
  devise_for :users, controllers: { invitations: 'invitations' }
  devise_scope :user do
    authenticated :user do
      root to: 'homes#show', as: :root_path
    end
  end

  unauthenticated do
    root to: 'devise/sessions#new'
  end

  resources :users, only: :destroy do
    member do
      get 'resend_invitation'
      get 'fin'
      get 'fin_revoke'
    end
  end
  resource :home, only: :show
  resource :ranking, only: :show
  resources :comments, only: :create
  resources :matches, except: [:create, :destroy, :new] do
    get 'set_type', on: :member
  end
  resources :notifications, only: :index do
    member do
      patch :display
    end
  end
end
