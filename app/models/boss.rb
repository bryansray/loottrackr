class Boss < ActiveRecord::Base
  attr_accessible :name
  
  has_many :drops
  has_many :items, :through => :drops
end
