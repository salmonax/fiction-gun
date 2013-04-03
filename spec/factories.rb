FactoryGirl.define do 
  factory :user do
    sequence(:email) {|n| "email#{n}"}
    password "gobbledygook1"
    password_confirmation "gobbledygook1"
    pen_name "kilroy"
  end

end