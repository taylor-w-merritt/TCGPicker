class Yugioh::Card < ActiveRecord::Base
  has_many :yugioh_releases, :class_name => 'Yugioh::Release'
  has_many :yugioh_sets, :through => :yugioh_releases, :class_name => 'Yugioh::Set'
end
