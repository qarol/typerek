# frozen_string_literal: true

module NotificationsHelper
  def notification_status(notification)
    if notification.display?
      content_tag :span, 'aktywny', class: 'badge badge-success'
    else
      content_tag :span, 'nieaktywny', class: 'badge badge-warning'
    end
  end
end
