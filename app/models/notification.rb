# frozen_string_literal: true

class Notification < ApplicationRecord
  scope :display, -> { where(display: true) }
end
