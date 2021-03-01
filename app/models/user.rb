class User < ActiveRecord::Base
    has_many :foods
    has_secure_password
    validates :password, length: {in: 4..30}, confirmation: true 
    validates :name, :email, :password, presence: true
    validates :email, uniqueness: true, length: {in: 5...30}
end
