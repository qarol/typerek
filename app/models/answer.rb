# Model opisuje co wytypowal uzytkownik dla podanego meczu
class Answer < ActiveRecord::Base
  belongs_to :match
  belongs_to :user

  enum result: [:win_a, :tie, :win_b, :win_tie_a, :win_tie_b, :not_tie]

  def point
    match.winning_list.include?(result) ? match.send(result).round(2) : 0.0
  end
end
