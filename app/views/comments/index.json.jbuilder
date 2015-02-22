json.array!(@comments) do |comment|
  json.extract! comment, :id, :user_email, :body, :post_id
  json.url comment_url(comment, format: :json)
end
