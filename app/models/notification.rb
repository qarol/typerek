class Notification < ActiveRecord::Base
  scope :display, -> { where(display: true) }
end
