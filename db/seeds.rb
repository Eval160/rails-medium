# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

puts "Delete all comments"
Comment.destroy_all

puts "Delete all votes"
Vote.destroy_all

puts "Delete all articles"
Article.destroy_all

puts "Delete all users"
User.destroy_all

puts "Create the dream team: users Riri, Fifi and Loulou"
riri = User.create! nickname: "Riri", email: "riri@gmail.com", password: "azerty"
fifi = User.create! nickname: "Fifi", email: "fifi@gmail.com", password: "azerty"
loulou = User.create! nickname: "Loulou", email: "loulou@gmail.com", password: "azerty"

puts "Try to populate this world a little bit: create random users"
for i in (1..10) do
  User.create! nickname: Faker::TvShows::RickAndMorty.character , email: Faker::Internet.email, password: "azerty"
end

puts "Create articles"
article_1 = Article.create! title: "Mon premier article", rich_content: "Cet article est vraiment pationnant, lisez le jusqu'au bout! Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", user: riri, publish: true
article_2 = Article.create! title: "Mon deuxieme article", rich_content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", user: fifi, publish: true

for i in (1..20) do
  title = Faker::Book.title
  content = Faker::Lorem.paragraph(sentence_count: 40, supplemental: true, random_sentences_to_add: 4)
  user = User.all.sample
  Article.create! title: title, rich_content: content, user: user, publish: true
end

puts "Create comments"
comment_1 = Comment.create! content: "Wouah super article, il m'a vraiment fait reflechir au sens de la vie", article: article_1, user: fifi
comment_2 = Comment.create! content: "Bof, j'ai deja lu plus interessant", article: article_2, user: loulou

for i in (1..60) do
  content = Faker::Lorem.paragraph(sentence_count: 2, supplemental: true, random_sentences_to_add: 4)
  article = Article.all.sample
  user = User.all.sample
  Comment.create! content: content, article: article, user: user
end


puts "Add some upvote"

for i in (1..100) do
  user = User.all.sample
  article = Article.all.sample
  Vote.create user: user, article: article
end

puts "Done!"
