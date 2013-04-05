# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

genres = [
  'Zombies',
  'Fantasy',
  'Science Fiction', 
  'Erotica',
  'Zombie Erotica', 
  'Mystery',
  'Historical Fiction',
  'Young Adult Fiction',
  'Flash Fiction'
]

# Genre.create(name: 'Thing')
genres.each { |genre| Genre.create(name: genre) }
