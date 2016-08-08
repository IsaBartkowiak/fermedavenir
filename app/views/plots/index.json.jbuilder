json.array!(@plots) do |plot|
  json.extract! plot, :id, :location, :generation_id
  json.url plot_url(plot, format: :json)
end
