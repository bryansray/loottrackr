class WelcomeController < ApplicationController
  def index
    @recent_loot = Loot.order("received_on DESC").limit(12)
    
    averages = @characters.map{ |c| c.gear_level }
    total = averages.inject(:+)
    length = averages.size

    @average_item_level = total.to_f / length
    @max_item_level = averages.max
    puts @average_item_level, @max_item_level
  end
end
