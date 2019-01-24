class Session < ApplicationRecord
  belongs_to :user
validates :token, presence: true,  length:{is: TOKEN_LENGTH} , uniqueness: true
before_validation :generate_token, on: :create
def expire!
update(status: false)
end
def self.get_user(t)
  find_by(status: true , token: t )
end


private
def generate_token
self.token = loop do
  random_token = SecureRandom.base58(TOKEN_LENGTH)
break random_token unless Session.exits?(token: random_token) 
  
end

end
end
