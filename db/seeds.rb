# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

genres = [
"Adventure",
"Bildungsroman",
"Black Comedy",
"Crime",
"Cyperpunk",
"Dystopian",
"Epic",
"Erotica",
"Existentialist",
"Fable",
"Fairy Tale",
"Fantasy",
"Fictional Autobiography",
"Fictional Biography",
"Flash Fiction",
"Gay Fiction",
"Gothic",
"Graphic Novel",
"Historical Fiction",
"Horror",
"Lesbian",
"Magic Realism",
"Mystery",
"Poem",
"Political Satire",
"Pulp Fiction",
"Romance",
"Romantic Comedy",
"Satire",
"Science Fiction",
"Sports",
"Spy",
"Steampunk",
"Supernatural",
"Swashbuckler",
"Sword & Sorcery",
"Thriller",
"Tragedy",
"Tragicomedy",
"Utopian",
"War",
"Western",
'Women\'s Fiction',
"Young Adult"
]

# Genre.create(name: 'Thing')
genres.each { |genre| Genre.create(name: genre) }
