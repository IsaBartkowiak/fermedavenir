json.array!(@legumes) do |legume|
  json.extract! legume, :id, :titre, :variete, :type, :date_plantation
  json.url legume_url(legume, format: :json)
end
