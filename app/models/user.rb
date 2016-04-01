class User < ActiveRecord::Base
  has_many :answers
  has_many :matches, through: :answers
  has_many :comments

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable,
         :rememberable, :trackable, :validatable

  scope :active, -> { where(invitation_token: nil) }

  validates :username, uniqueness: true, presence: true

  def points
    answers.map(&:point).sum.round(2)
  end

  def answer_by_match(match)
    answers.find_by(match: match)
  end

  def email_required?
    false
  end

  def email_changed?
    false
  end

  def fin!
    update_attribute(:fin, true)
  end

  def fin_revoke!
    update_attribute(:fin, false)
  end
end
