class Match < ActiveRecord::Base
  attr_accessible :NotTie, :start, :teamA, :teamB, :tie, :winA, :winB, :winTieA, :winTieB
  has_many :answers
end
