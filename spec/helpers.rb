module Helpers
  def before_all
    User.delete_all
    Skill.delete_all
    UserSkill.delete_all
    
    @make_origami      = create(:skill, :make_origami)
    @make_glass        = create(:skill, :make_glass)
    @draw_pictures     = create(:skill, :draw_pictures)
    @teach_english     = create(:skill, :teach_english)
    @teach_spanish     = create(:skill, :teach_spanish)
    @learn_english     = create(:skill, :learn_english)
    @learn_spanish     = create(:skill, :learn_spanish)
    @cut_wood          = create(:skill, :cut_wood)
    @work_with_animals = create(:skill, :work_with_animals)
    
    @adam = create(:adam)
    @eva = create(:eva)
  end
end