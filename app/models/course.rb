class Course < ApplicationRecord
    belongs_to :coordinator
    belongs_to :category
end
