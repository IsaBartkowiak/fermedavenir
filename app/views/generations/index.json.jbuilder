json.array!(@generations) do |generation|
  json.extract! generation, :id, :semi_from, :semi_to, :plantation, :recolte, :conservation_from, :conservation_to
  json.url generation_url(generation, format: :json)
end
