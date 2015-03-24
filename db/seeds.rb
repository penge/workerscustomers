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
  'translate english',
  'translate german',
  'translate french',
  'create website',
  'repair car',
  'fix kitchen',
].each do |skill|
  Skill.create!(name: skill)
end


# Create plenty of skills

alphabet = [*('a'..'z')]
(1..3000).each do |index|
  random_name = alphabet.sample(9).join
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
  User.create!(
    name: "Worker#{index}",
    surname: "Workeringon",
    email: "worker#{index}@workeringon.com",
    password: 'worker',
    skills: random_skills(skills, 3),
  )
end
