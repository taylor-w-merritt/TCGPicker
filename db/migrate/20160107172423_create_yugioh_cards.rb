class CreateYugiohCards < ActiveRecord::Migration
  def change
    create_table :yugioh_cards do |t|
      t.string :name
      t.text :text
      t.string :card_type
      t.string :type
      t.string :element
      t.integer :attack
      t.integer :defense
      t.integer :level
      t.string :property

      t.timestamps null: false
    end
  end
end
