json.array!(@hampers) do |hamper|
  json.extract! hamper, :id, :week
  json.url hamper_url(hamper, format: :json)
end
