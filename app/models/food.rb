class Food < ActiveRecord::Base
    belongs_to :user
    validates :name, :content, :meal, :make_again?, presence: true
end
