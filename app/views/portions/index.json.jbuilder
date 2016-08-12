json.array!(@portions) do |portion|
  json.extract! portion, :id, :hamper_id, :legume_id, :generation_id, :quantity
  json.url portion_url(portion, format: :json)
end
