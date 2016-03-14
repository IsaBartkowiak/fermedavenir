json.array!(@legumes) do |legume|
  json.extract! legume, :id, :titre, :variete, :type, :semi_deb, :semi_fin, :temps_pousse_min, :temps_pousse_max
  json.url legume_url(legume, format: :json)
end
