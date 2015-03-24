require 'rails_helper'

RSpec.describe User, type: :model do
  before :all do
    User.delete_all
    @user = create(:user)
  end
  
  describe '.authenticate' do
    it 'returns user' do
      expect(User.authenticate(@user.email, @user.password)).to eq @user
      expect(User.authenticate(@user.email, 'bad password')).to eq false
      expect(User.authenticate('bad email', @user.password)).to eq nil
    end
  end
  
  describe '#full_name' do
    it 'is composed of first and last name' do
      expect(@user.full_name).to eq "#{@user.name} #{@user.surname}"
    end
  end
end