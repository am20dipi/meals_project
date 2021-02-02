class User < ActiveRecord::Base
    has_many :meals
    # A macro that alerts ActiveRecord of the relationship between two Models; provides methods from ActiveRecord associations
    has_secure_password
    # A macro that provides methods such as: .authenticate

    # a user has a name, an email, a password
end
