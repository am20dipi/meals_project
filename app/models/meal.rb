class Meal < ActiveRecord::Base
    belongs_to :user
    
    # a meal has a name, content, and a type
    # validates name, content, type; has presence
end
