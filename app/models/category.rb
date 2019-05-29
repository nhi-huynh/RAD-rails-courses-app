class Category < ApplicationRecord
    has_and_belongs_to_many :courses
    
    VALID_STRING_REGEX = /./
    VALID_LOCATION_REGEX = /([0-9]{1,3})[.]([0-9]{1,3})[.]([0-9]{1,3})/
    
    validates :category,  presence: true, length: { maximum: 200 },
                          format: { with: VALID_STRING_REGEX }, 
                          uniqueness: { case_sensitive: false }
end
