module ApplicationHelper
  def user_status(user)
    capture_haml do
      if !user.invitation_token.blank?
        haml_tag :label, "nieaktywny", :class => "label label-warning"
      else
        haml_tag :label, "aktywny", :class => "label label-success"
      end
    end
  end
end
