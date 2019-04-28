json.extract! course, :id, :name, :prerequisite, :coordinator_id, :likes, :dislikes, :created_at, :updated_at
json.url course_url(course, format: :json)
