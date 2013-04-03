require 'spec_helper'

describe User do
  context 'validation' do
    it {should validate_uniqueness_of :email}
  end

  context 'accessibility' do
    it {should allow_mass_assignment_of :email}
    it {should allow_mass_assignment_of :password}
    it {should allow_mass_assignment_of :password_confirmation}
    it {should allow_mass_assignment_of :pen_name}
  end
end
