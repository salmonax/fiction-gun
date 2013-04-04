GENRES = ["Science Fiction","Fantasy","Literature","Mystery","Flash Fiction"]

FactoryGirl.define do
  factory :story do
    title 'the greatest story ever'
    text 'Once upon of time they had long tails and they went rarr. The end.'
    contributor_id 1
    genre_id 1
  end

  factory :genre do
    name 'Coolest Genre Evar'
  end
end