class LootsController < ApplicationController
  def index
    @bosses = Boss.all
  end
  
  def new
    @loot = Loot.new
    @items = Item.order(:name).map { |i| ["#{i.name} (#{i.level})", i.id] }
    @main_characters = @characters.order(:name).map { |c| [c.name, c.id] }
  end
  
  def create
    params[:loot][:received_on] = Chronic.parse(params[:loot][:received_on])
    @loot = Loot.new params[:loot]
    
    if @loot.save
      redirect_to new_loot_path
    else
      render :new
    end
  end
end