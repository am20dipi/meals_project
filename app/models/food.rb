class Food < ActiveRecord::Base
    #inherits from AR Base - has access to a number of methods that also assist in working with the database
    belongs_to :user
    validates :name, :content, :meal, presence: true

    
    # a meal has a name, content, and a type of meal
    # validates name, content, meal; has presence
end
