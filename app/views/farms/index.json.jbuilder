json.array!(@farms) do |farm|
  json.extract! farm, :id, :name, :slug
  json.url farm_url(farm, format: :json)
end
