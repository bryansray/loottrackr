class ItemsController < ApplicationController
  def show
    @item = Item.find(params[:id])
    @loots = Loot.where("item_id = ?", @item.id)
  end
  
  def edit
    @item = Item.find_by_armory_id(params[:id])
    @items = Item.order("name DESC").all
  end
  
  def update
    inventoryType = {
     0 =>  "Item",              # Default
     1 => "Head",              # Armor - Helm
     2 => "Neck",              # Armor - Neck
     3 => "Shoulder",          # Armor - Sholder
     4 => "Shirt",             # Armor - Shirt
     5 => "Chest",             # Armor - Chest (Vest)
     6 => "Waist",             # Armor - Belt
     7 => "Legs",              # Armor - Legs
     8 => "Feet",              # Armor - Feet
     9 => "Wrists",            # Armor - Bracer
     10 =>  "Hands",             # Armor - Gloves
     11 =>  "Finger",            # Armor - Ring
     12 =>  "Trinket",           # Armor - Trink
     13 =>  "One-Hand",          # Weapon - one-hand
     14 =>  "Off-Hand",          # Armor - Shield
     15 =>  "Ranged",            # Weapon - ranged (2-hand)
     16 =>  "Back",              # Armor - Back
     17 =>  "Two-Hand",          # Weapon - Two-Hand
     18 =>  "Bag",               # bag
     19 =>  "Tabard",            # Armor - tabard
     20 =>  "Chest",             # Armor - Chest (Robe)
     21 =>  "Main-Hand",         # Weapon - Main-Hand
     22 =>  "Off-Hand",          # Weapon - Off-Hand
     23 =>  "Held in Off-Hand",  # Armor - Off-Hand
     24 =>  "Junk",              # Junk
     25 =>  "Thrown",            # Thrown
     26 =>  "Ranged"             # Weapon - ranged (1-hand)
    }
    
    item = Item.find_by_armory_id(params[:id])
    item_id = item.armory_id

    if File.exists?(Rails.public_path + "/cache/item.#{item_id}.json")
      item_string = File.read(Rails.public_path + "/cache/item.#{item_id}.json")
    else
      item_string = api.item(item_id).to_json
      
      File.open(Rails.public_path + "/cache/item.#{item_id}.json", "w") do |f|
        f.write(item_string)
      end
    end
    
    item_json = JSON.parse(item_string)
    
    item.quality = item_json["quality"]
    item.slot = inventoryType[item_json["inventoryType"]]
    
    item.save
    
    redirect_to item
  end
end
