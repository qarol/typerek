# frozen_string_literal: true

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  layout :set_layout

  before_action :set_current_user
  before_action :require_user_logged_in!

  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.json { head :forbidden }
      format.html { redirect_to root_url, alert: exception.message }
    end
  end

  def set_current_user
    Current.user = User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def require_user_logged_in!
    redirect_to sign_in_path, alert: 'You must be signed in to do that.' if Current.user.nil?
  end

  def current_user
    Current.user
  end

  private

  def set_layout
    request.xhr? ? false : 'application'
  end
end
