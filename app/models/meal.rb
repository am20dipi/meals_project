class Meal < ActiveRecord::Base
    belongs_to :user
    validates :name, :content, :type, presence: true
    
    
    # a meal has a name, content, and a type
    # validates name, content, type; has presence
end
