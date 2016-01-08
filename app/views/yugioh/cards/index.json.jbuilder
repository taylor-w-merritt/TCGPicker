json.array!(@yugioh_cards) do |yugioh_card|
  json.extract! yugioh_card, :id, :name, :text, :card_type, :type, :element, :attack, :defense, :level, :property
  json.url yugioh_card_url(yugioh_card, format: :json)
end
