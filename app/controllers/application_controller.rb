# Glowny kontroler aplikacji
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  layout :set_layout

  before_filter :authenticate_user!

  def after_sign_in_path_for(_resource_or_scope)
    home_path
  end

  protected

  def only_admin
    redirect_to matches_path unless current_user.admin?
  end

  def set_layout
    request.xhr? ? false : 'application'
  end
end
