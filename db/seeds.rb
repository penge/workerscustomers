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