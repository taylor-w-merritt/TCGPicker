json.array!(@yugioh_releases) do |yugioh_release|
  json.extract! yugioh_release, :id, :print_tag, :rarity
  json.url yugioh_release_url(yugioh_release, format: :json)
end
