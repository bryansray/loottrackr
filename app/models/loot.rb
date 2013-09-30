class Loot < ActiveRecord::Base
  attr_accessible :character, :item, :received_on, :equipped, :disenchanted, :main, :item_id, :character_id

  belongs_to :character
  belongs_to :item
  
  scope :equipped, where(:equipped => true)
  
  def received_on_formatted
    received_on.strftime("%B %d, %Y")
  end
end
