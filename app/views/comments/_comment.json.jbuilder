json.extract! comment, :id, :name, :reply, :description, :created_at, :updated_at
json.url comment_url(comment, format: :json)
