class Genre < ActiveRecord::Base
  validates :name, :presence => true, :uniqueness => true
  attr_accessible :name
  has_many :stories
end