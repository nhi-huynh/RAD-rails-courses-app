class Coordinator < ApplicationRecord
    has_secure_password
    has_many :courses
    # mount_uploader :image, ImageUploader
end
