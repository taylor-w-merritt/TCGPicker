class Yugioh::Release < ActiveRecord::Base
  belongs_to :yugioh_card, :class_name => 'Yugioh::Card'
  belongs_to :yugioh_set, :class_name => 'Yugioh::Set'
end
