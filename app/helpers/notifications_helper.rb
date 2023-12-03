# frozen_string_literal: true

module NotificationsHelper
  def notification_status(notification)
    if notification.display?
      content_tag :span, 'aktywny', class: 'label label-success'
    else
      content_tag :span, 'nieaktywny', class: 'label label-warning'
    end
  end
end
