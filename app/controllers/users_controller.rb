# frozen_string_literal: true

class UsersController < ApplicationController
  def index
    @user = User.new
  end

  def create
    user = User.new(invitation_params.merge(invited_by: current_user))
    if user.save
      @token = user.generate_token_for(:invitation)
    else
      redirect_to users_path, alert: user.errors.full_messages.to_sentence
    end
  end

  def resend_invitation
    user = User.find(params[:id])
    authorize! :resend_invitation, user
    @token = user.generate_token_for(:invitation)
    render :create
  end

  def fin
    user = User.find(params[:id])
    authorize! :fin, user
    user.fin!
    redirect_to users_path
  end

  def fin_revoke
    user = User.find(params[:id])
    authorize! :fin_revoke, user
    user.fin_revoke!
    redirect_to users_path
  end

  def destroy
    user = User.find(params[:id])
    authorize! :destroy, user
    if user.destroy
      flash[:notice] = I18n.t('users.destroy.success')
    else
      flash[:error] = I18n.t('users.destroy.error')
    end
    redirect_to users_path
  end

  private

  def invitation_params
    params.require(:user).permit(:username)
  end
end
