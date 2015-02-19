json.array!(@logs) do |log|
  json.extract! log, :id, :issue, :description, :tried, :theories, :author
  json.url log_url(log, format: :json)
end
