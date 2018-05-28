# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
da = Language.create(name: "Danish")
en = Language.create(name: "English")
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

puts "created languages"



so = User.new(name: "Susanne", username: "sus", age:2, gender: "female",
  email: "test@gmail.com", address: "Copenhagen",
  description: "I speak fairly good Danish, but there is still room for improvement. I could imagine learning danish with a tandem partner.",
  dedication: "occassionally", password: "123456")
so.save

ma = User.new(name: "Maria", username: "mar", age:26, gender: "female",
  email: "test26@gmail.com", address: "Aarhus",
  description: "I speak fairly good Danish, but there is still room for improvement. I could imagine learning danish with a tandem partner.",
  dedication: "occassionally", password: "123456")
ma.save

bo = User.new(name: "Bodil", username: "bo70", age: 70, gender: "female",
  email: "test70@gmail.com", address: "Copenhagen",
  description: "I can teach you danish and I love to learn italian",
  dedication: "occassionally", password: "123456")
bo.save
if bo.save
  puts "created bo"
end

je = User.new(name: "Jens", username: "jens", age:23, gender: "male",
  email: "test23@gmail.com", address: "Aarhus",
  description: "I come from Sweden and I'd love to learn Danish from a native speaker",
  dedication: "occassionally", password: "123456")
je.save
puts "created je"


mar = User.new(name: "martin", username: "martin", age:99, gender: "male",
  email: "test99@gmail.com", address: "Copenhagen",
  description: "I'm just filling in some text, but I have nothing to say",
  dedication: "occassionally", password: "123456")
mar.save
puts "created ma"


lskill1 = LanguageSkill.new(score: 6)
lskill1.user = so
lskill1.language = it
lskill1.save

lskill1 = LanguageSkill.new(score: 6)
lskill1.user = je
lskill1.language = da
lskill1.save

lskill2 = LanguageSkill.new(score: 6)
lskill2.user = bo
lskill2.language = da
lskill2.save

lskill3 = LanguageSkill.new(score: 6)
lskill3.user = mar
lskill3.language = it
lskill3.save

lskill4 = LanguageSkill.new(score: 6)
lskill4.user = ma
lskill4.language = es
lskill4.save

lskill5 = LanguageSkill.new(score: 6)
lskill5.user = ma
lskill5.language = it
lskill5.save

lskill6 = LanguageSkill.new(score: 6)
lskill6.user = je
lskill6.language = sw
lskill6.save


lskill7 = LanguageSkill.new(score: 5)
lskill7.user = je
lskill7.language = da
lskill7.save
puts "added language skills to users"



lskill8 = LanguageSkill.new(score: 2)
lskill8.user = mar
lskill8.language = da
lskill8.save
puts "added language skills to users"


lskill9 = LanguageSkill.new(score: 3)
lskill9.user = mar
lskill9.language = es
lskill9.save
puts "added language skills to users"

lskill1 = LanguageSkill.new(score: 3)
lskill1.user = so
lskill1.language = da
lskill1.save

lskill8 = LanguageSkill.new(score: 4)
lskill8.user = ma
lskill8.language = da
lskill8.save
puts "added language skills to users"
