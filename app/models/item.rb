class Item < ActiveRecord::Base
  attr_accessor :standard_deviation
  attr_accessible :name, :level, :dropped_by, :item_type, :slot, :wowhead_id, :armory_id, :quality, :standard_deviation
  
  # belongs_to :slot
  
  validates :name, :uniqueness => { :scope => :level, :case_sensitive => false }
  
  def to_param
    armory_id
  end
  
  def heroic?
    self[:level] >= 566
  end
end
