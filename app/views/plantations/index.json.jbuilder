json.array!(@plantations) do |plantation|
  json.extract! plantation, :id, :farm_id, :generation_id, :quantity, :year
  json.url plantation_url(plantation, format: :json)
end
