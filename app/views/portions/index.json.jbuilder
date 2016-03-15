json.array!(@portions) do |portion|
  json.extract! portion, :id, :panier_id, :legume_id, :generation_id, :quantity
  json.url portion_url(portion, format: :json)
end
