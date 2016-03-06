require 'parser'

class Match < ActiveRecord::Base
  attr_accessible :not_tie, :start, :team_a, :team_b, :tie, :win_a, :win_b, :win_tie_a, :win_tie_b, :result_a, :result_b
  has_many :answers, dependent: :destroy
  has_many :users, through: :answers
  has_many :comments, dependent: :destroy

  validates_presence_of :team_a, :team_b

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

  def update_odds
    return if started?
    parser = Parser.new
    result = parser.get_match_odds [team_a, team_b, start.strftime('%FT%T')]
    update_attributes(win_a: result['_1'],
                      tie: result['_x'],
                      win_b: result['_2'],
                      win_tie_a: result['_1x'],
                      win_tie_b: result['_x2'],
                      not_tie: result['_12'])
  end

  def self.update_odds
    parser = Parser.new
    matches = Match.future.map { |m| [m.team_a, m.team_b, m.start.strftime('%FT%T')] }
    results = parser.process matches
    Match.future.each do |m|
      result = results[[m.team_a, m.team_b, m.start.strftime('%FT%T')]]
      next if result.blank? || result['_1'].blank?
      m.update_attributes(win_a: result['_1'],
                          tie: result['_x'],
                          win_b: result['_2'],
                          win_tie_a: result['_1x'],
                          win_tie_b: result['_x2'],
                          not_tie: result['_12'])
    end
  end
end
