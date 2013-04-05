class Story < ActiveRecord::Base

  validates :title, :text, :presence => true, :length => { :in => 6..255 }
  #validates :genre_id, :presence => true

  attr_accessible :title, :text, :genre_id

  has_many :contributions
  has_many :users, :through => :contributions

  belongs_to :genre
end