class Round < ActiveRecord::Base
  has_many :matches

  attr_accessible :name

  def self.current
    match = Match.pending.order(:start).first || Match.future.order(:start).first || Match.finished.order(:start).last
    match.try(:round) || self.first
  end

  def finished?
    !self.matches.map(&:finished?).include?(false)
  end
end
