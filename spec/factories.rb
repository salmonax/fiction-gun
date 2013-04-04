GENRES = ["Science Fiction","Fantasy","Literature","Mystery","Flash Fiction"]

FactoryGirl.define do 
  factory :user do
    sequence(:email) {|n| "email#{n}"}
    password "gobbledygook1"
    password_confirmation "gobbledygook1"
    pen_name "kilroy"
  end
  
  factory :story do
    title 'the greatest story ever'
    text 'Once upon of time they had long tails and they went rarr. The end.'
    genre_id 1
  end

  factory :genre do
    sequence(:name) {|n| "unique genre#{n}" }
  end
end