namespace :yugioh do
  desc 'Updates Yugioh Sets from API.'
  task import_sets: :environment do
    require 'open-uri'
    json_data = open('http://yugiohprices.com/api/card_sets').read
    parsed_json = JSON.parse(json_data)
    parsed_json.each do |set|
      puts "Determining if #{set} should be added..."

      if !::Yugioh::Set.exists?(:name => set)
        Yugioh::Set.create(name: set)
        puts "Added set #{set}."
      else
        puts "#{set} already existed."
      end
    end
  end

  desc 'Updates Yugioh Cards from API.'
  task :import_cards, [:set_name] => :environment do |task, args|
    if args.set_name.nil?
      Yugioh::Set.all.each do |set|
        import_cards_from_set(set.name)
      end
    else
      import_cards_from_set(args.set_name)
    end
  end

  def import_cards_from_set(set_name)
    require 'open-uri'
    require 'cgi'

    puts "Importing cards for set '#{set_name}'"

    escaped_set_name = CGI.escape(set_name)

    json_set_data = open("http://yugiohprices.com/api/set_data/#{escaped_set_name}").read
    parsed_set_data = JSON.parse(json_set_data)
    puts parsed_set_data

    if parsed_set_data['status'] == 'success'
      puts parsed_set_data['data']
      parsed_set_data['data']['cards'].each do |card|
        puts "--------------------------[ Starting Import of Card '#{card['name']}' ]--------------------------"
        import_card_to_db(card)
        import_release_to_db(card)
        puts "--------------------------[ Finished Import of Card '#{card['name']}' ]--------------------------"
        puts
      end
    else
      puts "An error occurred: #{parsed_set_data['message']}"
    end
  end

  def import_release_to_db(card)
    card['numbers'].each do |release|
      if !::Yugioh::Release.exists?(:print_tag => release['print_tag'], :rarity => release['rarity'])
        puts "Going to add release with print tag '#{release['print_tag']}' and rarity '#{release['rarity']}'..."

        yugioh_card = ::Yugioh::Card.find_by_name(card['name'])
        yugioh_set = ::Yugioh::Set.find_by_name(release['name'])

        if yugioh_card.nil?
          raise "Yugioh card '#{card['name']}' could not be found in the database!"
        end

        if yugioh_set.nil?
          raise "Yugioh set '#{release['name']}' could not be found in the database!"
        end

        ::Yugioh::Release.create(print_tag: release['print_tag'], rarity: release['rarity'], yugioh_card_id: yugioh_card.id, yugioh_set_id: yugioh_set.id)
      end
    end
  end

  def import_card_to_db(card)
    require 'open-uri'
    require 'cgi'

    puts 'Determining if card already exists in the database...'

    if !Yugioh::Card.exists?(:name => card['name'])
      puts 'Adding card to the database...'

      escaped_card_name = CGI.escape(card['name'])

      json_data = open("http://yugiohprices.com/api/card_data/#{escaped_card_name}").read
      parsed_data = JSON.parse(json_data)

      if parsed_data['status'] == 'success'
        parsed_card_data = parsed_data['data']

        ::Yugioh::Card.create(name: parsed_card_data['name'], text: parsed_card_data['text'],
                              card_type: parsed_card_data['card_type'], monster_group: parsed_card_data['type'],
                              element: parsed_card_data['family'], attack: parsed_card_data['atk'],
                              defense: parsed_card_data['def'], level: parsed_card_data['level'],
                              property: parsed_card_data['property'])
      else
        puts "An error occurred while adding card '#{card['name']}': #{parsed_data['message']}"
      end
    else
      puts 'Card already exists in the database.'
    end
  end
end
