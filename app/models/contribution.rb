class Contribution < ActiveRecord::Base

  # validates :user, :story, :presence => true
  attr_accessible :user_id, :story_id
  belongs_to :user
  belongs_to :story

end