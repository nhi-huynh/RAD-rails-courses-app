class Course < ApplicationRecord
    include CoursesHelper
    
    belongs_to :coordinator
    has_and_belongs_to_many :locations
    has_and_belongs_to_many :categories
    
    before_create :create_gravatar
    
    VALID_STRING_REGEX = /./
    VALID_NUMBER_REGEX = /(\d)+/
    
    validates :name,  presence: true, length: { maximum: 150 },
                      format: { with: VALID_STRING_REGEX }
    
    validates :prerequisite, presence: true, length: { maximum: 255 },
                             format: { with: VALID_STRING_REGEX }
                             
    validates :description, presence: true, length: { maximum: 1000 },
                            format: { with: VALID_STRING_REGEX } 

    validates :likes, length: { maximum: 10}, format: { with: VALID_NUMBER_REGEX } 
    
    validates :dislikes, length: { maximum: 10}, format: { with: VALID_NUMBER_REGEX }
    
    def hosted_in?(location)
        self.locations.include?(location)
    end
    
    def unhosted_course
        Location.all - self.locations
    end
    
    private
        def create_gravatar
            gravatar_id = Digest::MD5::hexdigest("random string")
            gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
            self.photo_url = gravatar_url
        end
        
end
