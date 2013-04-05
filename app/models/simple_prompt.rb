class SimplePrompt < ActiveRecord::Base
  attr_accessible :text, :user_id
  validates :text, :presence => true, :length => { :in => 10..140 }
  belongs_to :user
end
