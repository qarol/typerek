class Comment < ActiveRecord::Base
  belongs_to :match
  belongs_to :user

  attr_accessible :content, :match_id, :user_id

  delegate :username, :to => :user, :allow_nil => true, :prefix => false
end
