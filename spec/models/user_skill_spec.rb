require 'rails_helper'
require 'helpers'

RSpec.describe UserSkill, type: :model do
  include Helpers
  
  before :all do
    before_all
  end
  
  describe '.user_ids_having_required_skills' do
    it 'returns user ids having all the required skills' do
      user_ids = UserSkill.user_ids_having_required_skills([@make_origami.id])
      expect(user_ids).to be_empty
      
      @adam.skills << @make_origami
      @eva.skills << @teach_english
      
      # Look for one skill
      
      user_ids = UserSkill.user_ids_having_required_skills([@make_origami.id])
      expect(user_ids).to eq [@adam.id]
      
      user_ids = UserSkill.user_ids_having_required_skills([@teach_english.id])
      expect(user_ids).to eq [@eva.id]
      
      # Look for multiple skills
      
      user_ids = UserSkill.user_ids_having_required_skills([@make_origami.id, @teach_english.id])
      expect(user_ids).to be_empty
      
      @adam.skills << @teach_english
      
      user_ids = UserSkill.user_ids_having_required_skills([@make_origami.id, @teach_english.id])
      expect(user_ids).to eq [@adam.id]
    end
  end
end