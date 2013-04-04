class User < ActiveRecord::Base
  has_secure_password

  attr_accessible :email, :password, :password_confirmation, :pen_name

  validates :email, :password, :password_confirmation, :presence => true

  validates_uniqueness_of :email
end
