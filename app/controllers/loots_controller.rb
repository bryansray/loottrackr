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

    character = Character.find(params[:loot][:character_id])
    item = Item.find(params[:loot][:item_id])
    currently_equipped = character.loots.includes(:item).where("items.slot = ?", item.slot	)
    
    @loot = Loot.new params[:loot]

    
    if true # @loot.save
	  currently_equipped.each do |loot|
	  	loot.equipped = false
	  	loot.save
	  end
      redirect_to new_loot_path
    else
	  @items = Item.order(:name).map { |i| ["#{i.name} (#{i.level})", i.id] }
	  @main_characters = @characters.order(:name).map { |c| [c.name, c.id] }
	  
      render :new
    end
  end
end
