class Contribution < ActiveRecord::Base

  validates :user_id, :story_id, :presence => true
  attr_accessible :user_id, :story_id
  belongs_to :user
  belongs_to :story

end