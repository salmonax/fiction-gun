describe Genre do 
  it {should validate_presence_of :name}
  it {should allow_mass_assignment_of :name}
end