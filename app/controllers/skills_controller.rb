class SkillsController < ApplicationController
  before_action :authenticate_user!
  
  respond_to :js
  
  def index
    name = params[:query]
    @skills = Skill.alike_skills(name, 8)
    respond_with @skills
  end
end
