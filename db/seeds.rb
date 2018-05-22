# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

so = User.new(name: "Susanne", username: "sus", age:2, gender: "female",
  email: "test@gmail.com", address: "Copenhagen",
  description: "I speak fairly good Danish, but there is still room for improvement. I could imagine learning danish with a tandem partner.",
  dedication: "occassionally", password: "123456")
so.save

italian = Language.create(name: "Italian")
danish = Language.create(name: "Danish")
spanish = Language.create(name: "Spanish")
english = Language.create(name: "English")
german = Language.create(name: "German")


lskill1 = LanguageSkill.new(score: 5)
lskill1.user = so
lskill1.language = italian
lskill1.save

lskill1 = LanguageSkill.new(score: 1)
lskill1.user = so
lskill1.language = spanish
lskill1.save





