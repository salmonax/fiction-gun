class User < ActiveRecord::Base
  has_secure_password

  attr_accessible :email, :password, :password_confirmation, :pen_name

  validates :email, :password, :password_confirmation, :presence => true

  validates_uniqueness_of :email

  has_many :contributions
  has_many :stories, :through => :contributions
  has_many :simple_prompts

  def total_word_count
    self.stories.inject(0) {|total, story| total += story.word_count}
  end
end
