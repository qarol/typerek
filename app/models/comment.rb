# frozen_string_literal: true

# Model opisuje komentarz dodawany przez uzytkownika do meczu
class Comment < ActiveRecord::Base
  belongs_to :match
  belongs_to :user

  default_scope -> { order(created_at: :desc) }

  validates :content, presence: true, length: { maximum: 255 }

  delegate :username, to: :user, allow_nil: true, prefix: false
end
