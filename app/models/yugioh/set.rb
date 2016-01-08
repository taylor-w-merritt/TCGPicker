class Yugioh::Set < ActiveRecord::Base
  has_many :yugioh_releases, :class_name => 'Yugioh::Release'
  has_many :yugioh_cards, :through => :yugioh_releases, :class_name => 'Yugioh::Card'
end
