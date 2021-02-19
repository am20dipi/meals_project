class User < ActiveRecord::Base
    has_many :foods
    # A macro that alerts ActiveRecord of the relationship between two Models; provides methods from ActiveRecord associations
    has_secure_password
    # A macro that provides methods such as: .authenticate. ActiveRecord is working with BCrypt.
    validates :password, length: {in: 4..30}, confirmation: true 
    # checks to see if password matches the primary password input
    validates :name, :email, :password, presence: true
    # a user has a name, an email, a password
    #validates password confirmation: true
    validates :email, uniqueness: true, length: {in: 5...30}
    #validates uniqueness of email, and sets min/max of characters
end
