# -*- encoding : utf-8 -*-
class ApplicationController < ActionController::Base
  protect_from_forgery

  #before_filter :authenticate_user!

  def after_sign_out_path_for(resource_or_scope)
    root_path
  end

  def after_sign_in_path_for(resource_or_scope)
    home_path
  end

  protected
  def only_admin
    redirect_to matches_path unless current_user.admin?
  end
end
