# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

so = User.new(name: "Susanne", username: "sus", age:2, gender: "female",
  email: "test@gmail.com", city: "Copenhagen",
  description: "I speak fairly good Danish, but there is still room for improvement. I could imagine learning danish with a tandem partner.",
  dedication: "occassionally", password: "123456")
so.save

da = Language.create(name: "Danish")
en  = Language.create(name: "English")
fr = Language.create(name: "French")
es = Language.create(name: "Spanish")
ar = Language.create(name: "Arabic")
cmn = Language.create(name: "Mandarin")
ru = Language.create(name: "Russian")
pt = Language.create(name: "Portuguese")
de = Language.create(name: "German")
ja = Language.create(name: "Japanese")
hi = Language.create(name: "Hindi")
ms = Language.create(name: "Malay")
fa = Language.create(name: "Persian")
sw = Language.create(name: "Swahili")
ta = Language.create(name: "Tamil")
it = Language.create(name: "Italian")
nl = Language.create(name: "Dutch")
bn = Language.create(name: "Bengali")
tr = Language.create(name: "Turkish")
vi = Language.create(name: "Vietnamese")
pl = Language.create(name: "Polish")
jv = Language.create(name: "Javanese")
pa = Language.create(name: "Punjabi")
th = Language.create(name: "Thai")
ko = Language.create(name: "Korean")
sw = Language.create(name: "Swedish")
no = Language.create(name: "Norwegan")

lskill1 = LanguageSkill.new(score: 5)
lskill1.user = so
lskill1.language = it
lskill1.save

lskill1 = LanguageSkill.new(score: 1)
lskill1.user = so
lskill1.language = es
lskill1.save





