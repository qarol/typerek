# Model opisuje komentarz dodawany przez uzytkownika do meczu
class Comment < ActiveRecord::Base
  belongs_to :match
  belongs_to :user

  default_scope -> { order(created_at: :desc) }

  validates :content, presence: true

  delegate :username, to: :user, allow_nil: true, prefix: false
end
