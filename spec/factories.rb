GENRES = ["Science Fiction","Fantasy","Literature","Mystery","Flash Fiction"]

FactoryGirl.define do 
  factory :user do
    sequence(:email) {|n| "email#{n}"}
    password "gobbledygook1"
    password_confirmation "gobbledygook1"
    pen_name "kilroy"
    stories {
      Array(5..10).sample.times.map do
        FactoryGirl.create(:story) # optionally add traits: FactoryGirl.create(:book, :book_description)
      end
    }
  end
  
  factory :story do
    sequence(:title) { |n| "the greatest story ever, part #{n}" }
    sequence(:text) { |n| "Once upon of time they had long tails and they went rarr. Stay tuned for part #{n+1}." }
    genre_id 1
  end

  factory :genre do
    sequence(:name) {|n| "unique genre#{n}" }
  end
end