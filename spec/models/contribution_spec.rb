require 'spec_helper'

describe Contribution do

  # it {should validate_presence_of :user}
  # it {should validate_presence_of :story}

  it {should allow_mass_assignment_of :user_id}
  it {should allow_mass_assignment_of :story_id}

  it {should belong_to :user}
  it {should belong_to :story}
  

end