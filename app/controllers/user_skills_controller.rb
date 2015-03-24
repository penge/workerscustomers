class UserSkillsController < ApplicationController
  before_action :authenticate_user!
  before_action :authorize_user!
  
  respond_to :js
  
  def create
    skill_id = params[:skill_id]
    skill = Skill.find_by(id: skill_id)
    current_user.skills << skill if skill
  end
  
  def destroy
    UserSkill.where(user_id: current_user.id, skill_id: params[:id]).destroy_all
  end
end
