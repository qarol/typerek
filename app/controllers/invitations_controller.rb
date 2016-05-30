# Kontroler zapraszajacy uzytkownikow do systemu
class InvitationsController < Devise::InvitationsController
  before_action :authorize_actions

  protected

  def authorize_actions
    authorize! :manage, resource_class
  end

  def invite_resource
    resource_class.invite!(invite_params, current_inviter) do |u|
      u.skip_invitation = true
    end
  end
end
