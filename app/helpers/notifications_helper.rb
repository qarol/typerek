# frozen_string_literal: true

module NotificationsHelper
  def notification_status(notification)
    capture_haml do
      if notification.display?
        haml_tag :span, 'aktywny', class: 'label label-success'
      else
        haml_tag :span, 'nieaktywny', class: 'label label-warning'
      end
    end
  end
end
