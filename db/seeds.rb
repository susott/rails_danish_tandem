# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Suse = User.new(name: "suse", username: "susott", age:31, gender: "female",
  email: "susott@gmx.de", address: "Copenhagen",
  description: "I speak fairly good Danish, I think, but still not enough for danish employers... Now I have given up!",
  dedication: "occassionally", password: "123456")
Suse.save

