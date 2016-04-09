json.array!(@parcelles) do |parcelle|
  json.extract! parcelle, :id, :location, :generation_id
  json.url parcelle_url(parcelle, format: :json)
end
