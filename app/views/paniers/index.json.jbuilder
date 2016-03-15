json.array!(@paniers) do |panier|
  json.extract! panier, :id, :semaine
  json.url panier_url(panier, format: :json)
end
