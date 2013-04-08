require 'spec_helper'

describe Dashboard do

  context '#stories' do

    let(:user) {FactoryGirl.create :user}

    it 'displays the stories of the user who is logged in' do
      story = FactoryGirl.create(:story, :users => [user])
      dashboard = Dashboard.new(user)
      dashboard.stories.should eq user.stories
    end
  end

  context '#user' do
    it 'returns the current user' do
      user = FactoryGirl.create(:user)
      dashboard = Dashboard.new(user)
      dashboard.user.should eq user
    end
  end
end