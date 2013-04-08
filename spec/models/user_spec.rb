require 'spec_helper'

describe User do
  context 'validation' do
    it {should validate_presence_of :email}
    it {should validate_presence_of :password}
    it {should validate_presence_of :password_confirmation}
    it {should validate_uniqueness_of :email}
    it {should validate_uniqueness_of :email}
  end

  context 'accessibility' do
    it {should allow_mass_assignment_of :email}
    it {should allow_mass_assignment_of :password}
    it {should allow_mass_assignment_of :password_confirmation}
    it {should allow_mass_assignment_of :pen_name}
  end

  context 'password security' do
    it 'validates strength of a password'
  end

  context 'associations' do
    it {should have_many(:stories).through(:contributions)}
    it {should have_many(:contributions)}
    it {should have_many(:simple_prompts)}
  end

  context '#total_word_count' do
    it 'should show the total word count for a user, across stories.' do
      user = FactoryGirl.create(:user)
      user.stories.inject(0) { |total, story| total += story.word_count }.
        should eq user.total_word_count
    end
  end

end
