require 'spec_helper'

describe Story do
  it {should validate_presence_of :title}
  it {should validate_presence_of :text}
  #it {should validate_presence_of :genre_id}

  it {should allow_mass_assignment_of :title}
  it {should allow_mass_assignment_of :text}
  it {should allow_mass_assignment_of :genre_id}

  it {should have_many(:contributions)}
  it {should have_many(:users).through(:contributions)}
  it {should belong_to :genre}

  context '#word_count' do
    it 'shows the number of words typed into the current text field for the story' do
      @story = Story.new(title: 'the end', text: 'we are all really happy', genre_id: 7)
      @story.save
      @story.word_count.should eq 5
    end
  end

  context '#word_limit' do
    it 'limits the number of words displayed to as many words as you want' do
      @story = Story.new(title: 'the end', text: 'we are all really happy to be learning at Epicodus', genre_id: 7)
      @story.save
      @story.word_limit(7).should eq 'we are all really happy to be...'
    end
  end

  
end