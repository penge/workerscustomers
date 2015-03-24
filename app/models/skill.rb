class Skill < ActiveRecord::Base
  def self.alike_skills(name, limit)
    Skill.where('name LIKE ?', "%#{name}%").limit(limit)
  end
end
