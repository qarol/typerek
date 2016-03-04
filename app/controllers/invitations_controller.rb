class InvitationsController < Devise::InvitationsController
  before_filter :check_admin, except: [:edit, :update]

  private

  def check_admin
    redirect home_path unless current_user.admin?
  end

  def invite_resource
    resource_class.invite!(invite_params, current_inviter) do |u|
      u.skip_invitation = true
    end
  end

  protected

  def build_resource(hash = nil)
    hash ||= resource_params || {}
    if hash[:username]
      self.resource = resource_class.where(username: hash[:username], encrypted_password: '').first
      if resource
        resource.attributes = hash
        resource.send_confirmation_instructions if resource.confirmation_required_for_invited?
        resource.accept_invitation
      end
    end
    self.resource ||= super
  end
end
