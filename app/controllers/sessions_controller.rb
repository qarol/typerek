# frozen_string_literal: true

class SessionsController < ApplicationController
  skip_before_action :require_user_logged_in!

  def new
    @user = User.new
  end

  def create
    @user = User.authenticate_by(username: session_params[:username], password: session_params[:password])
    if @user.present?
      session[:user_id] = @user.id
      redirect_to root_path, notice: I18n.t('sessions.create.logged_in')
    else
      @user = User.new(username: session_params[:username])
      flash[:alert] = I18n.t('sessions.create.invalid_credentials')
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to sign_in_path, notice: I18n.t('sessions.destroy.logged_out')
  end

  private

  def session_params
    params.require(:user).permit(:username, :password)
  end
end
