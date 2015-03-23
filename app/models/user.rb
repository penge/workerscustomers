class User < ActiveRecord::Base
  has_secure_password
  
  has_many :user_skills
  has_many :skills, through: :user_skills
  
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true
  
  def self.authenticate(email, password)
    User.find_by(email: email).try(:authenticate, password)
  end
end
