class User < ActiveRecord::Base
  self.per_page = 20
  
  has_secure_password
  
  has_many :user_skills
  has_many :skills, through: :user_skills
  
  validates :email, presence: true, uniqueness: true
  validates :name, presence: true
  validates :surname, presence: true
  
  def self.authenticate(email, password)
    User.find_by(email: email).try(:authenticate, password)
  end
  
  def full_name
    name + ' ' + surname
  end
end
