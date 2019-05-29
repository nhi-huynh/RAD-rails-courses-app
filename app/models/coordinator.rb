class Coordinator < ApplicationRecord
    include CoordinatorsHelper
    
    attr_accessor :remember_token   #, :activation_token
    before_save   :downcase_email
    before_create :create_gravatar
    
    
    has_secure_password
    has_many :courses
    
    validates :name,  presence: true, length: { maximum: 50 }
    
    SPECIAL_EMAIL =  /[admin]/
    VALID_EMAIL_REGEX = /[admin]|([a-z])+[.]([a-z])+@rmit[.]edu[.]au/ 
    
    
    validates :email, presence: true, length: { maximum: 255 },
                      uniqueness: { case_sensitive: false }
    
    validates_format_of :email, :with =>  VALID_EMAIL_REGEX     #SPECIAL_EMAIL ||

    validates :password, presence: true, length: { minimum: 6 }, allow_nil: false

    # Returns the hash digest of the given string.
    def Coordinator.digest(string)
        cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                      BCrypt::Engine.cost
        BCrypt::Password.create(string, cost: cost)
    end

    # Returns a random token.
    def Coordinator.new_token
        SecureRandom.urlsafe_base64
    end

    #Remembers a Coordinator in the database for use in persistent sessions.
    def remember
        self.remember_token = Coordinator.new_token
        update_attribute(:remember_digest, Coordinator.digest(remember_token))
    end

    #Returns true if the given token matches the digest.
    def authenticated?(remember_token)
        return false if remember_digest.nil?
        BCrypt::Password.new(remember_digest).is_password?(remember_token)
    end
  
    # Returns true if the given token matches the digest.
    def authenticated?(attribute, token)
        digest = send("#{attribute}_digest")
        return false if digest.nil?
        BCrypt::Password.new(digest).is_password?(token)
    end
  
    # Forgets a Coordinator.
    def forget
        update_attribute(:remember_digest, nil)
    end
  
    # Activates an account.
    # def activate
    #     update_attribute(:activated,    true)
    #     update_attribute(:activated_at, Time.zone.now)
    # end

    # Sends activation email.
    # def send_activation_email
    #     CoordinatorMailer.account_activation(self).deliver_now
    # end
    
    private
        # Converts email to all lower-case.
        def downcase_email
          self.email = email.downcase
        end
        
        def create_gravatar
            gravatar_id = Digest::MD5::hexdigest("random string")
            gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
            self.photo_url = gravatar_url
        end

        
        # Creates and assigns the activation token and digest.
        # def create_activation_digest
        #   self.activation_token  = Coordinator.new_token
        #   self.activation_digest = Coordinator.digest(activation_token)
        # end
end
