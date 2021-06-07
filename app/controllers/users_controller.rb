# frozen_string_literal: true

# Kontroler obsluguje liste uzytkownikow systemu.
class UsersController < ApplicationController
  def resend_invitation
    @user = User.find(params[:id])
    authorize! :resend_invitation, @user
    @user.invite!(current_user)
    render 'devise/invitations/create'
  end

  def fin
    @user = User.find(params[:id])
    authorize! :fin, @user
    @user.fin!
    redirect_to new_user_invitation_path
  end

  def fin_revoke
    @user = User.find(params[:id])
    authorize! :fin_revoke, @user
    @user.fin_revoke!
    redirect_to new_user_invitation_path
  end

  def destroy
    @user = User.find(params[:id])
    authorize! :destroy, @user
    if @user.destroy
      flash[:notice] = 'Usunięto użytkownika.'
    else
      flash[:error] = 'Nie udało się usunąć użytkownika.'
    end
    redirect_to new_user_invitation_path
  end
end
