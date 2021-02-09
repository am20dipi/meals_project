class Meal < ActiveRecord::Base
    #inherits from AR Base - has access to a number of methods that also assist in working with the database
    belongs_to :user
    validates :name, :content, :type, presence: true

    
    # a meal has a name, content, and a type
    # validates name, content, type; has presence
end
