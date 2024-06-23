# frozen_string_literal: true

# Glowny helper aplikacji
module ApplicationHelper
  def user_status(user)
    if user.invitation_accepted_at.present?
      content_tag :label, 'aktywny', class: 'badge badge-success'
    else
      content_tag :label, 'zaproszony', class: 'badge badge-warning'
    end
  end

  def user_fin(user)
    if user.fin?
      content_tag :label, '$$$', class: 'badge badge-success', style: 'cursor:pointer'
    else
      content_tag :label, '$$$', class: 'badge badge-danger', style: 'cursor:pointer'
    end
  end

  def reset_button()
    content_tag :label, 'resetuj dostęp', class: 'badge badge-warning', style: 'cursor:pointer'
  end

  def delete_button()
    content_tag :label, 'usuń', class: 'badge badge-danger', style: 'cursor:pointer'
  end
end
