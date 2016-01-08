class CreateYugiohSets < ActiveRecord::Migration
  def change
    create_table :yugioh_sets do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
