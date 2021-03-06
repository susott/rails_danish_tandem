
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

female_pictures = ["portrait_female.jpeg","portrait_woman.jpeg","woman2.jpeg"]
male_pictures = ["portrait_male.jpeg","portrait_man.jpeg"]
other_pictures = ["portrait_male.jpeg","portrait_man.jpeg","portrait_female.jpeg","portrait_woman.jpeg","portrait_giraffe.jpeg"]
background_pictures = ["background_copenhagen.jpeg","background_flower.jpeg","background_nature.jpeg","background_nature.jpg","background_family"]



200.times do
  gender_var = ["male","female","other"].sample
  name = Faker::FunnyName.name.split.first

  newuser = User.new(
    name: name,
    age: rand(15..70),
    gender: gender_var,
    email: "#{name}#{rand(1..100)}@gmail.com",
    dedication: ["occassionally", "once per month", "once per week", "more often"].sample,
    address: ["Copenhagen","Aarhus","Odense","Aalborg","Frederiksberg","Esbjerg","Kolding","Vejle","Hellerup"].sample,
    password: "123456",
    description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
                tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
                quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
                consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
                cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
                proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
  )

  if gender_var == "female"
    female_picture = ["portrait_female.jpeg","portrait_woman.jpeg","woman2.jpeg"].sample
    newuser.photo = Rails.root.join("app/assets/images/#{female_picture}").open
  elsif gender_var == "male"
    male_picture = ["portrait_male.jpeg","portrait_man.jpeg"].sample
    newuser.photo = Rails.root.join("app/assets/images/#{male_picture}").open
  else
    other_picture = ["portrait_male.jpeg","portrait_man.jpeg","portrait_female.jpeg","portrait_woman.jpeg","portrait_giraffe.jpeg"].sample
    newuser.photo = Rails.root.join("app/assets/images/#{other_picture}").open
  end

  background_picture = ["background_copenhagen.jpeg",
    "background_flower.jpeg","background_nature.jpeg",
    "background_nature.jpg","background_family.jpeg",
    "background_celebration.jpeg","background_village.jpeg",
    "background_car.jpeg","background_pumpkins.jpeg",
    "background_beach.jpeg","background_city.jpeg"].sample
  newuser.photo_background  = Rails.root.join("app/assets/images/#{background_picture}").open

  if newuser.save
    puts "saved a user"
  end

  lskill1 = LanguageSkill.new(score: 6)
  lskill1.user = newuser
  native_lang = [da,da,da,da,da,da,da,da,fr,es,ru,de,sw,it,en].sample
  # native_lang = [da,en].sample
  lskill1.language = native_lang
  if lskill1.save
    puts "saved native language"
  end

  if native_lang == da
    puts "native dane"
    newscore = rand(1..5)
    lskill2 = LanguageSkill.new(score: newscore)
    lskill2.user = newuser
    lskill2.language = [fr,es,ru,de,sw,it,en].sample
    lskill2.save
  else
    newscore = rand(1..5)
    puts "foreigner"
    lskill2 = LanguageSkill.new(score: newscore)
    lskill2.user = newuser
    lskill2.language = da
    lskill2.save
  end
end

puts "Created random fake users"




so = User.new(name: "Larissa", age:32, gender: "female",
  email: "test@gmail.com", address: "Hellerup",
  description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
  dedication: "occassionally", password: "123456")

so.photo = Rails.root.join("app/assets/images/woman2.jpeg").open
so.photo_background = Rails.root.join("app/assets/images/background_nature.jpg").open
so.save

# ma = User.new(name: "Maria", username: "mar", age:26, gender: "female",
#   email: "test26@gmail.com", address: "Aarhus",
#   description: "I speak fairly good Danish, but there is still room for improvement. I could imagine learning danish with a tandem partner.",
#   dedication: "more often", password: "123456")
# ma.photo = Rails.root.join("app/assets/images/portrait_woman.jpeg").open
# ma.photo_background = Rails.root.join("app/assets/images/background_flower.jpeg").open
# ma.save


bo = User.new(name: "Bodil", username: "bo70", age: 38, gender: "female",
  email: "test70@gmail.com", address: "Vejle",
  description: "I can teach you danish and I love to learn italian",
  dedication: "once per week", password: "123456")
bo.photo = Rails.root.join("app/assets/images/portrait_female.jpeg").open
bo.photo_background = Rails.root.join("app/assets/images/background_copenhagen.jpeg").open

bo.save

# je = User.new(name: "Jens", username: "jens", age:50, gender: "male",
#   email: "test23@gmail.com", address: "Aarhus",
#   description: "I come from Sweden and I'd love to learn Danish from a native speaker",
#   dedication: "once per week", password: "123456")
# je.photo = Rails.root.join("app/assets/images/portrait_man.jpeg").open
# je.photo_background = Rails.root.join("app/assets/images/background1.jpeg").open
# je.save
# puts "created je"


# mar = User.new(name: "martin", username: "martin", age:24, gender: "male",
#   email: "test99@gmail.com", address: "Copenhagen",
#   description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
# tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
# quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
# consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
# cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
# proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
#   dedication: "occassionally", password: "123456")
# mar.photo = Rails.root.join("app/assets/images/portrait_male.jpeg").open
# mar.photo_background = Rails.root.join("app/assets/images/background_copenhagen.jpeg").open
# mar.save
# puts "created ma"

# jo = User.new(name: "joachim", age: 37, gender: "male",
#   email: "test100@gmail.com", address: "Frederiksberg",
#   description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
# tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
# quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
# consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
# cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
# proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
#   dedication: "once per month", password: "123456")
# jo.photo = Rails.root.join("app/assets/images/portrait_giraffe.jpeg").open
# jo.photo_background = Rails.root.join("app/assets/images/background_family.jpeg").open
# jo.save
# puts "created jo"


lskill155 = LanguageSkill.new(score: 6)
lskill155.user = so
lskill155.language = it
lskill155.save

# lskill1 = LanguageSkill.new(score: 6)
# lskill1.user = je
# lskill1.language = da
# lskill1.save

lskill255 = LanguageSkill.new(score: 6)
lskill255.user = bo
lskill255.language = da
lskill255.save

# lskill3 = LanguageSkill.new(score: 6)
# lskill3.user = mar
# lskill3.language = it
# lskill3.save

# lskill4 = LanguageSkill.new(score: 6)
# lskill4.user = ma
# lskill4.language = es
# lskill4.save

# lskill5 = LanguageSkill.new(score: 6)
# lskill5.user = ma
# lskill5.language = it
# lskill5.save

# lskill6 = LanguageSkill.new(score: 6)
# lskill6.user = je
# lskill6.language = sw
# lskill6.save

# lskill14 = LanguageSkill.new(score: 6)
# lskill14.user = jo
# lskill14.language = da
# lskill14.save

# lskill15 = LanguageSkill.new(score: 2)
# lskill15.user = jo
# lskill15.language = ru
# lskill15.save


# lskill7 = LanguageSkill.new(score: 5)
# lskill7.user = je
# lskill7.language = da
# lskill7.save
# puts "added language skills to users"



# lskill8 = LanguageSkill.new(score: 2)
# lskill8.user = mar
# lskill8.language = da
# lskill8.save
# puts "added language skills to users"


# lskill9 = LanguageSkill.new(score: 3)
# lskill9.user = mar
# lskill9.language = es
# lskill9.save
# puts "added language skills to users"

lskill125 = LanguageSkill.new(score: 3)
lskill125.user = so
lskill125.language = da
lskill125.save

# lskill8 = LanguageSkill.new(score: 4)
# lskill8.user = ma
# lskill8.language = da
# lskill8.save
# puts "added language skills to users"

lskill225 = LanguageSkill.new(score: 2)
lskill225.user = bo
lskill225.language = it
lskill225.save
