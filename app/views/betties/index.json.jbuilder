json.array!(@betties) do |betty|
  json.extract! betty, :id, :description
  json.url betty_url(betty, format: :json)
end
