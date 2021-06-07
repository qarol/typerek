# frozen_string_literal: true

# Model opisuje co wytypowal uzytkownik dla podanego meczu
class Answer < ActiveRecord::Base
  belongs_to :match
  belongs_to :user

  enum result: { win_a: 0, tie: 1, win_b: 2, win_tie_a: 3, win_tie_b: 4, not_tie: 5 }

  def point
    match.winning_list.include?(result) ? match.send(result).round(2) : 0.0
  end
end
