class Match < ActiveRecord::Base
  attr_accessible :NotTie, :start, :teamA, :teamB, :tie, :winA, :winB, :winTieA, :winTieB, :resultA, :resultB
  has_many :answers
  has_many :users, :through => :answers

  validates_numericality_of :resultA, :only_integer => true, :message => "Wynik musi być liczbą całkowitą"
  validates_numericality_of :resultB, :only_integer => true, :message => "Wynik musi być liczbą całkowitą"

  def started?
    self.start < DateTime.now
  end
end
