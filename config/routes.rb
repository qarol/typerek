Typerek::Application.routes.draw do
  get "rounds/show"

  devise_for :users, :controllers => { :invitations => 'invitations' }

  resources :users, :only => [ :destroy ] do
    get 'resend_invitation', :on => :member
    get 'fin', :on => :member
    get 'fin_revoke', :on => :member
  end
  resource :home, :only => [ :show ]
  resource :ranking, :only => [ :show ]
  resources :comments, :only => [ :create ]
  resources :rounds, :only => [ :show, :index ] do
    resources :matches do
      get 'set_type', :on => :member
    end
  end
  resources :matches do
    get 'set_type', :on => :member
  end

  root :to => redirect("/users/sign_in")
end
