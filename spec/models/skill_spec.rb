require 'rails_helper'
require 'helpers'

RSpec.describe Skill, type: :model do
  include Helpers
  
  before :all do
    before_all
  end
  
  describe '.alike_skills' do
    it 'returns skills whose name contains substring' do
      search = Skill.alike_skills('cut', 30)
      expect(search.size).to eq 1
      expect(search.first.name).to eq @cut_wood.name
      
      search = Skill.alike_skills('wo', 30)
      expect(search.size).to eq 2
      expect(search.first.name).to eq @cut_wood.name
      expect(search.second.name).to eq @work_with_animals.name
    end

    it 'returns limited results' do
      search = Skill.alike_skills('ish', 10)
      expect(search.size).to eq 4
      
      search = Skill.alike_skills('ish', 2)
      expect(search.size).to eq 2
    end
  end
end