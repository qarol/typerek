class Answer < ActiveRecord::Base
  belongs_to :match
  belongs_to :user

  validates :result, numericality: { only_integer: true, message: 'Wybierz poprawny rodzaj typowania' },
                     inclusion: { in: 0..5, message: 'Wybierz poprawny rodzaj typowania' }

  def point
    match.winning_list.include?(result) ? match.send(Match::FIELD[result]).round(2) : 0
  end
end
