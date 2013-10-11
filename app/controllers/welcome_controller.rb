class WelcomeController < ApplicationController
  def index
    @recent_loot = Loot.joins(:item).where("item_id IS NOT NULL AND items.level >= ?", 533).order("received_on DESC").limit(25)
    
    averages = @characters.map{ |c| c.gear_level }
    total = averages.inject(:+)
    length = averages.size

    @average_item_level = total.to_f / length
    @max_item_level = averages.max
  end
end
