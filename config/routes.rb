Rails.application.routes.draw do
  devise_for :users, :controllers => { :invitations => 'invitations' }

  resources :users, :only => [ :destroy ] do
    get 'resend_invitation', :on => :member
    get 'fin', :on => :member
    get 'fin_revoke', :on => :member
  end
  resource :home, :only => [ :show ]
  resource :ranking, :only => [ :show ]
  resources :comments, :only => [ :create ]
  resources :matches do
    get 'set_type', :on => :member
  end

  root :to => redirect("/users/sign_in")
end
