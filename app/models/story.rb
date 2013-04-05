class Story < ActiveRecord::Base

  validates :title, :text, :genre_id, :presence => true

  attr_accessible :title, :text, :genre_id

  has_many :contributions
  has_many :users, :through => :contributions

  belongs_to :genre
end