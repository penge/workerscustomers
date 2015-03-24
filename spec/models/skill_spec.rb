require 'rails_helper'

RSpec.describe Skill, type: :model do
  before :all do
    Skill.delete_all
    create(:skill, name: 'draw pictures')
    create(:skill, name: 'cut wood')
    create(:skill, name: 'make origami')
    create(:skill, name: 'make glass')
    create(:skill, name: 'teach English')
    create(:skill, name: 'teach Spanish')
    create(:skill, name: 'learn English')
    create(:skill, name: 'learn Spanish')
    create(:skill, name: 'work with animals')
  end
  
  describe '.alike_skills' do
    it 'returns skills whose name contains substring' do
      search = Skill.alike_skills('cut', 30)
      expect(search.size).to eq 1
      expect(search.first.name).to eq 'cut wood'
      
      search = Skill.alike_skills('wo', 30)
      expect(search.size).to eq 2
      expect(search.first.name).to eq 'cut wood'
      expect(search.second.name).to eq 'work with animals'
    end

    it 'returns limited results' do
      search = Skill.alike_skills('ish', 10)
      expect(search.size).to eq 4
      
      search = Skill.alike_skills('ish', 2)
      expect(search.size).to eq 2
    end
  end
end