# Glowny kontroler aplikacji
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  layout :set_layout

  before_filter :authenticate_user!

  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.json { head :forbidden }
      format.html { redirect_to root_url, alert: exception.message }
    end
  end

  def after_sign_in_path_for(_resource_or_scope)
    home_path
  end

  protected

  def set_layout
    request.xhr? ? false : 'application'
  end
end
