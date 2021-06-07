# frozen_string_literal: true

class Notification < ActiveRecord::Base
  scope :display, -> { where(display: true) }
end
