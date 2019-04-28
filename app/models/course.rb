class Course < ApplicationRecord
    belongs_to :coordinator
    belongs_to :category
    has_many :locations
end
