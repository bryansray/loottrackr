class Drop < ActiveRecord::Base
  attr_accessible :dropped_on
  
  belongs_to :boss
  belongs_to :item
end
