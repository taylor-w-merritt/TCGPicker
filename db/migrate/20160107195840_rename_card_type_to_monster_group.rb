class RenameCardTypeToMonsterGroup < ActiveRecord::Migration
  def change
    rename_column :yugioh_cards, :type, :monster_group
  end
end
