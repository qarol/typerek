class Answer < ActiveRecord::Base
  belongs_to :match
  belongs_to :user
  attr_accessible :result, :user_id

  validates_numericality_of :result, only_integer: true, message: 'Wybierz poprawny rodzaj typowania'
  validates_inclusion_of :result, in: 0..5, message: 'Wybierz poprawny rodzaj typowania'

  def point
    if match.winning_list.include?(result)
      match.send(Match::FIELD[result]).round(2)
    else
      0
    end
  end
end
