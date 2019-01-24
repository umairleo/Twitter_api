class User < ApplicationRecord
has_secure_password
  validates :username , presence: true , uniqueness: true
validates :email , presence: true , uniqueness: true , format: {with:  /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i, message: 'format is not accepted'} 
validates :name , presence: true ,  length: {in: 3..25, message: 'min 3 chracter long and maximum 25 chracter long'}
validate :password_validation  
has_many :sessions, dependent: :destroy
has_many :tweets, dependent: :destroy
private
def password_validation  
if password.nil? && password_digest.nil?
  errors.add(:password) 

end
end
end
