class Character < ActiveRecord::Base
  attr_accessible :name, :clazz
  
  has_many :loots
  has_many :items, :through => :loots
  has_many :equipped_items, :through => :loots, :class_name => "Item", :conditions => { :loots => {:equipped => true} }, :source => :item
  
  def gear_level
    return 0 if equipped_items.empty?
    (sum_equipped_items / equipped_items.size).round(2)
  end
  
  def css_color_code
    character_class = self[:clazz].gsub(/\s+/, "").underscore
    return "#C41F3B" if character_class == "death_knight"
    return "#FF7D0A" if character_class == "druid"
    return "#ABD473" if character_class == "hunter"
    return "#69CCF0" if character_class == "mage"
    return "#558A84" if character_class == "monk"
    return "#F58CBA" if character_class == "paladin"
    return "#FFFFFF" if character_class == "priest"
    return "#FFF569" if character_class == "rogue"
    return "#0070DE" if character_class == "shaman"
    return "#9482C9" if character_class == "warlock"
    return "#C79C6E" if character_class == "warrior"
  end
  
  private
    def sum_equipped_items
      equipped_items.inject(0.0) { |result, item| result + item.level }
    end
end
