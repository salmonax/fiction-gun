class Genre < ActiveRecord::Base
  validates :name, :presence => true
  attr_accessible :name
end