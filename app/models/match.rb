# frozen_string_literal: true

class Match < ActiveRecord::Base
  has_many :answers, dependent: :destroy
  has_many :users, through: :answers
  has_many :comments, dependent: :destroy

  validates :team_a, :team_b, presence: true, length: { maximum: 255 }
  validates :win_a, :tie, :win_b, :win_tie_a, :win_tie_b, :not_tie,
            numericality: { greater_than_or_equal_to: 0 }, allow_blank: true
  validates :result_a, :result_b,
            numericality: { greater_than_or_equal_to: 0, only_integer: true },
            allow_blank: true

  scope :finished, lambda {
    where(arel_table[:start].lt(DateTime.now))
      .where.not(result_a: nil)
      .where.not(result_b: nil)
      .order(:start)
  }
  scope :pending, lambda {
    where(arel_table[:start].lt(DateTime.now))
      .where(result_a: nil)
      .where(result_b: nil)
      .order(:start)
  }
  scope :future, lambda {
    where(arel_table[:start].gt(DateTime.now))
      .order(:start)
  }

  def started?
    start.present? && start < DateTime.now
  end

  def finished?
    result_a.present? && result_b.present? && started?
  end

  def current?
    started? && !finished?
  end

  def winning_list
    if result_a.blank? || result_b.blank?
      []
    elsif result_a > result_b
      %w[win_a win_tie_a not_tie]
    elsif result_a < result_b
      %w[win_b win_tie_b not_tie]
    elsif result_a == result_b
      %w[tie win_tie_a win_tie_b]
    else
      []
    end
  end
end
