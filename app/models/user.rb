class User < ActiveRecord::Base
  has_many :answers
  has_many :matches, :through => :answers
  has_many :comments

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :invitable, :database_authenticatable,
         :recoverable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :password, :password_confirmation, :remember_me, :username
  # attr_accessible :title, :body
  
  scope :active, where(:invitation_token => nil)
  validates_uniqueness_of :username

  def points
    self.answers.map(&:point).inject(0, :+)
  end
end
