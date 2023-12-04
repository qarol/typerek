# frozen_string_literal: true

# Model opisuje podstawowego uzytkownika systemu
class User < ApplicationRecord
  self.ignored_columns += [:email, :encrypted_password, :reset_password_token, :reset_password_sent_at,
                           :remember_created_at, :sign_in_count, :current_sign_in_at, :last_sign_in_at,
                           :current_sign_in_ip, :last_sign_in_ip, :confirmation_token, :confirmed_at,
                           :confirmation_sent_at, :unconfirmed_email, :failed_attempts, :unlock_token,
                           :locked_at, :invitation_token, :invitation_created_at, :invitation_sent_at,
                           :invitation_limit]

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
