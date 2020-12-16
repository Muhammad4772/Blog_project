json.extract! blog, :id, :Tittle, :Publisher, :Discription, :created_at, :updated_at
json.url blog_url(blog, format: :json)
