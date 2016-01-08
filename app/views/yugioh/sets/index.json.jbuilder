json.array!(@yugioh_sets) do |yugioh_set|
  json.extract! yugioh_set, :id, :name
  json.url yugioh_set_url(yugioh_set, format: :json)
end
