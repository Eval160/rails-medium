# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Create users Riri, Fifi and Loulou"
riri = User.create! email: "riri@gmail.com", password: "azerty"
fifi = User.create! email: "fifi@gmail.com", password: "azerty"
loulou = User.create! email: "loulou@gmail.com", password: "azerty"
