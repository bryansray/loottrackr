class Item < ActiveRecord::Base
  attr_accessible :name, :level, :dropped_by, :type, :wowhead_id
  
  validates :name, :uniqueness => { :scope => :level, :case_sensitive => false }
  
  def heroic?
    self[:level] > 397
  end
end
