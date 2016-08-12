json.array!(@generations) do |generation|
  json.extract! generation, :id, :seedling_from, :seedling_to, :plantation, :harvest, :conservation_from, :available_for
  json.url generation_url(generation, format: :json)
end
