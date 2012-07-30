class Item < ActiveRecord::Base
  attr_accessible :name, :level, :dropped_by, :item_type, :slot, :wowhead_id, :armory_id
  
  # belongs_to :slot
  
  validates :name, :uniqueness => { :scope => :level, :case_sensitive => false }
    
  def heroic?
    self[:level] > 397
  end
end
