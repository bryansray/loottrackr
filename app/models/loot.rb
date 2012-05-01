class Loot < ActiveRecord::Base
  attr_accessible :character, :item, :received_on, :equipped, :disenchanted, :main

  belongs_to :character
  belongs_to :item
  
  scope :equipped, where(:equipped => true)
end
