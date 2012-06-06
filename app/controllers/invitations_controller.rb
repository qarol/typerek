class InvitationsController < Devise::InvitationsController
  before_filter :check_admin, :except => [:edit, :update]

  def create
    @user = User.invite!(:username => params[:user][:username], :email => "#{params[:user][:username]}@example.com") do |u|
      u.skip_invitation = true
    end
  end

  private
  def check_admin
    redirect home_path unless current_user.admin?
  end
end
