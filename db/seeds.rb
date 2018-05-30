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


so = User.new(name: "Larissa", age:32, gender: "female",
  email: "test@gmail.com", address: "Hellerup",
  description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
  dedication: "occassionally", password: "123456")
so.photo = Rails.root.join("app/assets/images/women2.jpeg").open
so.photo_background = Rails.root.join("app/assets/images/background_nature.jpg").open
so.save

ma = User.new(name: "Maria", username: "mar", age:26, gender: "female",
  email: "test26@gmail.com", address: "Aarhus",
  description: "I speak fairly good Danish, but there is still room for improvement. I could imagine learning danish with a tandem partner.",
  dedication: "more often", password: "123456")
ma.photo = Rails.root.join("app/assets/images/portrait_women.jpeg").open
ma.photo_background = Rails.root.join("app/assets/images/background_flower.jpeg").open
ma.save

bo = User.new(name: "Bodil", username: "bo70", age: 38, gender: "female",
  email: "test70@gmail.com", address: "Vejle",
  description: "I can teach you danish and I love to learn italian",
  dedication: "once per week", password: "123456")
bo.photo = Rails.root.join("app/assets/images/portrait_female.jpeg").open
bo.photo_background = Rails.root.join("app/assets/images/background_copenhagen.jpeg").open

bo.save
if bo.save
  puts "created bo"
end

je = User.new(name: "Jens", username: "jens", age:50, gender: "male",
  email: "test23@gmail.com", address: "Aarhus",
  description: "I come from Sweden and I'd love to learn Danish from a native speaker",
  dedication: "once per week", password: "123456")
je.photo = Rails.root.join("app/assets/images/portrait_man.jpeg").open
je.photo_background = Rails.root.join("app/assets/images/background1.jpeg").open
je.save
puts "created je"


mar = User.new(name: "martin", username: "martin", age:24, gender: "male",
  email: "test99@gmail.com", address: "Copenhagen",
  description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
  dedication: "occassionally", password: "123456")
mar.photo = Rails.root.join("app/assets/images/portrait_male.jpeg").open
mar.photo_background = Rails.root.join("app/assets/images/background_family.jpeg").open
mar.save
puts "created ma"

jo = User.new(name: "joachim", age: 37, gender: "male",
  email: "test100@gmail.com", address: "Frederiksberg",
  description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
  dedication: "once per month", password: "123456")
jo.photo = Rails.root.join("app/assets/images/portrait_giraffe.jpeg").open
jo.photo_background = Rails.root.join("app/assets/images/background_family.jpeg").open
jo.save
puts "created jo"


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

lskill2 = LanguageSkill.new(score: 2)
lskill2.user = bo
lskill2.language = it
lskill2.save
