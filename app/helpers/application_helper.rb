# frozen_string_literal: true

# Glowny helper aplikacji
module ApplicationHelper
  def user_status(user)
    if user.invitation_accepted_at.present?
      content_tag :label, 'aktywny', class: 'label label-success'
    else
      content_tag :label, 'zaproszony', class: 'label label-warning'
    end
  end

  def user_fin(user)
    if user.fin?
      content_tag :label, '$$$', class: 'label label-success', style: 'cursor:pointer'
    else
      content_tag :label, '$$$', class: 'label label-danger', style: 'cursor:pointer'
    end
  end

  def reset_button()
    content_tag :label, 'resetuj dostęp', class: 'label label-warning', style: 'cursor:pointer'
  end

  def delete_button()
    content_tag :label, 'usuń', class: 'label label-danger', style: 'cursor:pointer'
  end

  def details_link(match)
    if match.started?
      content_tag :a, "zobacz", href: match_path(match)
    else
      "-"
    end
  end

end
