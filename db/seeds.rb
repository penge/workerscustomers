# Clean db

UserSkill.delete_all
Skill.delete_all
User.delete_all


# Create basic skills

skills = [
  'cook',
  'clean house',
  'fix computer',
  'draw pictures',
  'write lyrics',
  'write stories',
  'make pancakes',
  'bake bread',
  'train aikido',
  'translate English',
  'translate German',
  'translate French',
  'translate Spanish',
  'teach English',
  'teach German',
  'teach French',
  'teach Spanish',
  'create website',
  'repair car',
  'fix kitchen',
  'make origami',
  'make glass',
  'cut wood',
  'work with animals',
  'paint walls',
  'rehouse or relocate',
  'repair furniture',
].each do |skill|
  Skill.create!(name: skill)
end


# Create plenty of skills

(1..3000).each do |index|
  random_name = Faker::Hacker.ingverb + "#{index}"
  Skill.create!(name: random_name)
end


# Define helper method for assigning random skills

def random_skills(skills, count)
  Skill.where(name: skills.sample(count))
end


# Create users

tom = User.create!(
  name: 'Tom',
  surname: 'Aubegader',
  email: 'tom@abc.com',
  password: 'tom',
  skills: random_skills(skills, 3),
)

ema = User.create!(
  name: 'Ema',
  surname: 'Marden',
  email: 'ema@abc.com',
  password: 'ema',
  skills: random_skills(skills, 3),
)


# Create batch of workers

(1..200).each do |index|
  name = Faker::Name.first_name
  surname = Faker::Name.last_name
  email = "#{name.downcase}#{index}@#{surname.downcase}.com"
  User.create!(
    name: name,
    surname: surname,
    email: email,
    password: 'worker',
    skills: random_skills(skills, 3),
  )
end
