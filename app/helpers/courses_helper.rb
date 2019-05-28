module CoursesHelper
    
    # Returns the Gravatar for the given course.
    def gravatar_for(course_name)
        gravatar_id = Digest::MD5::hexdigest(course_name.downcase)
        return gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
        #image_tag(gravatar_url, alt: course.name, class: "gravatar")
    end
    
    # # Returns the Gravatar for the given course.
    # def show_gravatar(@course)
    #     gravatar_id = Digest::MD5::hexdigest(course_name.downcase)
    #     return gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    #     image_tag(gravatar_url, alt: course.name, class: "gravatar")
    # end
    
end
