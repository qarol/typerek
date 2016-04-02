# Model opisuje co wytypowal uzytkownik dla podanego meczu
class Answer < ActiveRecord::Base
  belongs_to :match
  belongs_to :user

  #validates :result, inclusion: { in: results, message: 'Wybierz poprawny rodzaj typowania' }

  enum result: [ :win_a, :tie, :win_b, :win_tie_a, :win_tie_b, :not_tie ]

  def point
    match.winning_list.include?(result) ? match.send(Match::FIELD[result]).round(2) : 0
  end
end
