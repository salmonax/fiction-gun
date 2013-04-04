
FactoryGirl.define do 
  factory :user do
    sequence(:email) {|n| "email#{n}"}
    password "gobbledygook1"
    password_confirmation "gobbledygook1"
    pen_name "kilroy"
  end

FactoryGirl.define do
  factory :story do
    title 'the greatest story ever'
    text 'Once upon of time they had long tails and they went rarr. The end.'
    contributor_id 1
    genre_id 1
  end
end