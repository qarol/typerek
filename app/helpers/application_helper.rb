# frozen_string_literal: true

# Glowny helper aplikacji
module ApplicationHelper
  def user_status(user)
    capture_haml do
      if user.invitation_token.blank?
        haml_tag :label, 'aktywny', class: 'label label-success'
      else
        haml_tag :label, 'nieaktywny', class: 'label label-warning'
      end
    end
  end

  def user_fin(user)
    capture_haml do
      if user.fin?
        haml_tag :label, ':D', class: 'label label-success', style: 'cursor:pointer'
      else
        haml_tag :label, ':(', class: 'label label-danger', style: 'cursor:pointer'
      end
    end
  end
end
