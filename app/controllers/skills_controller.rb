class SkillsController < ApplicationController
  before_action :authenticate_user!
  
  respond_to :js
  
  def index
    query = params[:query]
    logger.info query
    @skills = Skill.where('name LIKE ?', "%#{query}%").limit(8)
    respond_with @skills
  end
end
