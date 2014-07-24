class User < ActiveRecord::Base
  has_many :answers
  has_many :matches, :through => :answers
  has_many :comments

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable,
         :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :password, :password_confirmation, :remember_me, :username, :skip_invitation
  
  scope :active, lambda { where(:invitation_token => nil) }

  validates_uniqueness_of :username
  validates_presence_of :username

  def points
    self.regular_points + self.bonus_points
  end

  def answer_by_match match
    self.answers.find_by_match_id(match.id)
  end

  def email_required?
    false
  end
  def email_changed?
    false
  end

  def fin!
    self.update_attribute(:fin, true)
  end

  def fin_revoke!
    self.update_attribute(:fin, false)
  end

  protected
  def regular_points
    self.answers.map(&:point).inject(0, :+).round(2)
  end
  def bonus_points
    bonus = 0
    correct_answers = self.answers.select { |answer| answer.is_correct? }
    group_correct_answers = correct_answers.group_by(&:match_round)
    group_correct_answers.keys.select { |round| round.finished? }.each do |round|
      array_size = group_correct_answers[round].size
      bonus += array_size if array_size >= 3 # Przydziel bonusowe punkty, jeżeli dobrze wytypowano co najmniej 3 mecze
    end
    bonus
  end
end
