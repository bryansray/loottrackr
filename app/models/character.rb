class Character < ActiveRecord::Base
  attr_accessible :name, :clazz
  
  has_many :loots
  has_many :items, :through => :loots
  has_many :equipped_items, :through => :loots, :class_name => "Item", :conditions => { :loots => {:equipped => true} }, :source => :item
  
  def gear_level
    return 0 if equipped_items.empty?
    sum_equipped_items / equipped_items.size
  end
  
  private
    def sum_equipped_items
      equipped_items.inject(0.0) { |result, item| result + item.level }
    end
end
