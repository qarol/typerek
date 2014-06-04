Typerek::Application.routes.draw do
  devise_for :users, :controllers => { :invitations => 'invitations' }

  resources :users, :only => [ :destroy ] do
    get 'resend_invitation', :on => :member
  end
  resource :home
  resource :ranking
  resources :comments
  resources :matches do
    get 'set_type', :on => :member
  end

  root :to => redirect("/users/sign_in")
end
