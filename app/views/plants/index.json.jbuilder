json.array!(@plants) do |plant|
  json.extract! plant, :id, :titre, :variete, :type, :semi_deb, :semi_fin, :temps_pousse_min, :temps_pousse_max
  json.url plant_url(plant, format: :json)
end
