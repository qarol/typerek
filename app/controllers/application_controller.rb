# frozen_string_literal: true

# Glowny kontroler aplikacji
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  layout :set_layout

  before_action :authenticate_user!

  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.json { head :forbidden }
      format.html { redirect_to root_url, alert: exception.message }
    end
  end

  protected

  def set_layout
    request.xhr? ? false : 'application'
  end
end
