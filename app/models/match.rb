class Match < ActiveRecord::Base
  attr_accessible :NotTie, :start, :teamA, :teamB, :tie, :winA, :winB, :winTieA, :winTieB, :resultA, :resultB
  has_many :answers
  has_many :users, :through => :answers
  has_many :comments

  #validates_numericality_of :resultA, :only_integer => true, :message => "Wynik musi być liczbą całkowitą"
  #validates_numericality_of :resultB, :only_integer => true, :message => "Wynik musi być liczbą całkowitą"

  FIELD = [:winA, :tie, :winB, :winTieA, :winTieB, :NotTie]

  scope :finished, where("start < ? AND (resultA IS NOT NULL OR resultB IS NOT NULL)", DateTime.now).order(:start)
  scope :pending, where("start < ? AND resultA IS NULL AND resultB IS NULL", DateTime.now).order(:start)
  scope :future, where("start > ?", DateTime.now).order(:start)

  def started?
    self.start < DateTime.now
  end

  def finished?
    !self.resultA.blank? && !self.resultB.blank? && self.started?
  end

  def current?
    self.started? && !self.finished?
  end

  def winningList
    if (self.resultA.blank? || self.resultB.blank?)
      []
    elsif (self.resultA > self.resultB)
      [0,3,5]
    elsif (self.resultA < self.resultB)
      [2,4,5]
    elsif (self.resultA == self.resultB)
      [1,3,4]
    else
      []
    end
  end
end
