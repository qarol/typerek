# Kontroler zapraszajacy uzytkownikow do systemu
class InvitationsController < Devise::InvitationsController
  before_filter :check_admin, except: [:edit, :update]

  protected

  def check_admin
    redirect_to home_path unless current_user.admin?
  end

  def invite_resource
    resource_class.invite!(invite_params, current_inviter) do |u|
      u.skip_invitation = true
    end
  end
end
