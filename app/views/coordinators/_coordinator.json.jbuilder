json.extract! coordinator, :id, :name, :email, :password_digest, :created_at, :updated_at
json.url coordinator_url(coordinator, format: :json)
