class Loot < ActiveRecord::Base
  attr_accessible :character, :item, :received_on, :equipped, :disenchanted

  belongs_to :character
  belongs_to :item
  
  scope :equipped, where(:equipped => true)
end
