class Item < ActiveRecord::Base
  attr_accessible :name, :level, :dropped_by, :type, :wowhead_id
  
  def heroic?
    self[:level] > 397
  end
end
