class Loot < ActiveRecord::Base
  attr_accessible :character, :item, :received_on, :equipped, :disenchanted, :main, :item_id, :character_id, :is_manual_assignment

  belongs_to :character
  belongs_to :item

  accepts_nested_attributes_for :character
  
  scope :equipped, where(:equipped => true)
  
  def received_on_formatted
    received_on.strftime("%B %d, %Y")
  end
end
