class CreateYugiohReleases < ActiveRecord::Migration
  def change
    create_table :yugioh_releases do |t|
      t.belongs_to :yugioh_card, :class_name => 'Yugioh::Card'
      t.belongs_to :yugioh_set, :class_name => 'Yugioh::Set'
      t.string :print_tag
      t.string :rarity

      t.timestamps null: false
    end
  end
end
