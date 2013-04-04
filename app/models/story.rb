class Story < ActiveRecord::Base

  validates :title, :text, :contributor_id, :genre_id, :presence => true

  attr_accessible :title, :text, :contributor_id, :genre_id

end