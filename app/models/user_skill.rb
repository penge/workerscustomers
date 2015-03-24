class UserSkill < ActiveRecord::Base
  belongs_to :user
  belongs_to :skill
  
  def self.user_ids_having_required_skills(skill_ids)
    UserSkill
      .select('user_id')
      .group(:user_id)
      .where(skill_id: skill_ids)
      .having('count(*)=?', skill_ids.count)
      .pluck(:user_id)
  end
end
