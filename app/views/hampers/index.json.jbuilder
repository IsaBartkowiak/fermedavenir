json.array!(@hampers) do |hamper|
  json.extract! hamper, :id, :semaine
  json.url hamper_url(hamper, format: :json)
end
