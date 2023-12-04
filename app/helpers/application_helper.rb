# frozen_string_literal: true

# Glowny helper aplikacji
module ApplicationHelper
  def user_status(user)
    if user.invitation_accepted_at.present?
      content_tag :label, 'aktywny', class: 'label label-success'
    else
      content_tag :label, 'nieaktywny', class: 'label label-warning'
    end
  end

  def user_fin(user)
    if user.fin?
      content_tag :label, ':D', class: 'label label-success', style: 'cursor:pointer'
    else
      content_tag :label, ':(', class: 'label label-danger', style: 'cursor:pointer'
    end
  end
end
