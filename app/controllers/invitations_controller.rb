# frozen_string_literal: true

class InvitationsController < ApplicationController
  skip_before_action :require_user_logged_in!

  def show
    @user = User.find_by_token_for!(:invitation, params[:token])
  rescue ActiveSupport::MessageVerifier::InvalidSignature
    redirect_to sign_in_path, alert: 'Nieprawidłowy token'
  end

  def update
    @user = User.find_by!(username: accept_params[:username])
    if @user.accept_invitation(accept_params)
      session[:user_id] = @user.id
      redirect_to home_path, notice: 'Zaproszenie zaakceptowane'
    else
      render :show
    end
  end

  private

  def accept_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
end
