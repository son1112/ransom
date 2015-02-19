json.array!(@posts) do |post|
  json.extract! post, :id, :test
  json.url post_url(post, format: :json)
end
