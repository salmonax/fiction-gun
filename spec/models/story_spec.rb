require 'spec_helper'

describe Story do
  it {should validate_presence_of :title}
  it {should validate_presence_of :text}
  it {should validate_presence_of :genre_id}

  it {should allow_mass_assignment_of :title}
  it {should allow_mass_assignment_of :text}
  it {should allow_mass_assignment_of :genre_id}


  it {should have_many(:users).through(:contributions)}

  it {should belong_to :genre}
  
end