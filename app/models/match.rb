require 'parser'

class Match < ActiveRecord::Base
  has_many :answers, dependent: :destroy
  has_many :users, through: :answers
  has_many :comments, dependent: :destroy

  validates :team_a, presence: true
  validates :team_b, presence: true

  FIELD = [:win_a, :tie, :win_b, :win_tie_a, :win_tie_b, :not_tie].freeze

  scope :finished, -> { where('start < ? AND (result_a IS NOT NULL OR result_b IS NOT NULL)', DateTime.now).order(:start) }
  scope :pending, -> { where('start < ? AND result_a IS NULL AND result_b IS NULL', DateTime.now).order(:start) }
  scope :future, -> { where('start > ?', DateTime.now).order(:start) }

  def started?
    !start.blank? && start < DateTime.now
  end

  def finished?
    !result_a.blank? && !result_b.blank? && started?
  end

  def current?
    started? && !finished?
  end

  def winning_list
    if result_a.blank? || result_b.blank?
      []
    elsif result_a > result_b
      [0, 3, 5]
    elsif result_a < result_b
      [2, 4, 5]
    elsif result_a == result_b
      [1, 3, 4]
    else
      []
    end
  end
end
