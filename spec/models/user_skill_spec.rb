require 'rails_helper'
require 'helpers'

RSpec.describe UserSkill, type: :model do
  include Helpers
  
  before :all do
    before_all
  end
  
  describe '.user_ids_having_required_skills' do
    before :each do
      @adam.skills.delete_all
      @eva.skills.delete_all
    end
    
    it 'returns empty array if no one has the required skill' do
      user_ids = UserSkill.user_ids_having_required_skills([@make_origami.id])
      expect(user_ids).to be_empty
    end
    
    it 'returns empty array if no one has all the required skills' do
      @adam.skills << @make_origami
      
      user_ids = UserSkill.user_ids_having_required_skills([@make_origami.id, @teach_english.id])
      expect(user_ids).to be_empty
    end
    
    it 'returns array with one user id that have the required skill' do
      @adam.skills << @make_origami
      
      user_ids = UserSkill.user_ids_having_required_skills([@make_origami.id])
      expect(user_ids).to eq [@adam.id]
    end
    
    it 'returns array with one user id that have all the required skills' do
      @adam.skills << @make_origami << @teach_english
      @eva.skills << @make_origami
      
      user_ids = UserSkill.user_ids_having_required_skills([@make_origami.id, @teach_english.id])
      expect(user_ids).to eq [@adam.id]
    end
    
    it 'returns array with multiple user ids having all the required skills' do
      @adam.skills << @make_origami << @teach_english
      @eva.skills << @make_origami << @teach_english
      
      user_ids = UserSkill.user_ids_having_required_skills([@make_origami.id, @teach_english.id])
      expect(user_ids).to include @adam.id
      expect(user_ids).to include @eva.id
    end
  end
end