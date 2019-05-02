class Course < ApplicationRecord
    belongs_to :coordinator
    has_and_belongs_to_many :locations
    has_and_belongs_to_many :categories
    
    def hosted_in?(location)
        self.locations.include?(location)
    end
    
    def unhosted_course
        Location.all - self.locations
    end

end
