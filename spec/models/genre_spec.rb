require 'spec_helper'

describe Genre do 
  it {should validate_presence_of :name}
  it {should allow_mass_assignment_of :name}
  it {should validate_uniqueness_of :name}
  it {should have_many :stories}
end