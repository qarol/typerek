# frozen_string_literal: true

class User < ApplicationRecord
  has_secure_password validations: false

  generates_token_for :invitation, expires_in: 24.hours do
    password_salt&.last(10)
  end

  has_many :answers, dependent: :destroy
  has_many :matches, through: :answers
  has_many :comments, dependent: :nullify
  belongs_to :invited_by, polymorphic: true, optional: true

  scope :active, -> { where.not(invitation_accepted_at: nil) }

  validates :username, uniqueness: true, presence: true, length: { maximum: 255 }
  validates :password, confirmation: true, presence: true, length: { minimum: 6 }, on: :update

  delegate :username, to: :invited_by, prefix: true, allow_nil: true

  def points
    answers.map(&:point).sum.round(2)
  end

  def answer_by_match(match)
    answers.find_by(match: match)
  end

  def fin!
    update_attribute(:fin, true)
  end

  def fin_revoke!
    update_attribute(:fin, false)
  end

  def accept_invitation(params = {})
    update(params.merge(invitation_accepted_at: DateTime.now))
  end
end
