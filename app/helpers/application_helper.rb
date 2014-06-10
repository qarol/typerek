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

  def user_fin(user)
    capture_haml do
      if user.fin?
        haml_tag :label, ":D", :class => "label label-success"
      else
        haml_tag :label, ":(", :class => "label label-danger"
      end
    end
  end
end
