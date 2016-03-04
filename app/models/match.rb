require 'parser'

class Match < ActiveRecord::Base
  attr_accessible :NotTie, :start, :teamA, :teamB, :tie, :winA, :winB, :winTieA, :winTieB, :resultA, :resultB
  has_many :answers, dependent: :destroy
  has_many :users, through: :answers
  has_many :comments, dependent: :destroy

  validates_presence_of :teamA, :teamB

  FIELD = [:winA, :tie, :winB, :winTieA, :winTieB, :NotTie].freeze

  scope :finished, -> { where('start < ? AND (resultA IS NOT NULL OR resultB IS NOT NULL)', DateTime.now).order(:start) }
  scope :pending, -> { where('start < ? AND resultA IS NULL AND resultB IS NULL', DateTime.now).order(:start) }
  scope :future, -> { where('start > ?', DateTime.now).order(:start) }

  def started?
    !start.blank? && start < DateTime.now
  end

  def finished?
    !resultA.blank? && !resultB.blank? && started?
  end

  def current?
    started? && !finished?
  end

  def winning_list
    if resultA.blank? || resultB.blank?
      []
    elsif resultA > resultB
      [0, 3, 5]
    elsif resultA < resultB
      [2, 4, 5]
    elsif resultA == resultB
      [1, 3, 4]
    else
      []
    end
  end

  def update_odds
    return if started?
    parser = Parser.new
    result = parser.get_match_odds [teamA, teamB, start.strftime('%FT%T')]
    update_attributes(winA: result['_1'],
                      tie: result['_x'],
                      winB: result['_2'],
                      winTieA: result['_1x'],
                      winTieB: result['_x2'],
                      NotTie: result['_12'])
  end

  def self.update_odds
    parser = Parser.new
    matches = Match.future.map { |m| [m.teamA, m.teamB, m.start.strftime('%FT%T')] }
    results = parser.process matches
    Match.future.each do |m|
      result = results[[m.teamA, m.teamB, m.start.strftime('%FT%T')]]
      next if result.blank? || result['_1'].blank?
      m.update_attributes(winA: result['_1'],
                          tie: result['_x'],
                          winB: result['_2'],
                          winTieA: result['_1x'],
                          winTieB: result['_x2'],
                          NotTie: result['_12'])
    end
  end
end
