require 'pp'
require 'json'

class CharactersController < ApplicationController
  def index
  end
  
  def new
    @character = Character.new
  end
  
  def create
    @character = Character.new(params[:character])
    
    if @character.save
      redirect_to @character
    else
      render :action => :new
    end
  end
  
  def show
    @character = Character.find_by_name(params[:id])    
    @cached_file_at = File.mtime(Rails.public_path + "/cache/character.#{@character.to_param}.json") if File.exists?(Rails.public_path + "/cache/character.#{@character.to_param}.json")
    @average_items = Item.find_by_sql("select slot, AVG(level) as 'level', STD(level) as 'standard_deviation' FROM items INNER JOIN loots ON items.id = loots.item_id INNER JOIN characters ON loots.character_id = characters.id WHERE characters.main = true AND loots.equipped = true and slot is NOT NULL GROUP BY slot ORDER BY slot")
    @average_items.each do |i|
      i.standard_deviation = ActiveRecord::Base.connection.select_value("select STD(level) as 'standard_deviation' FROM items INNER JOIN loots ON items.id = loots.item_id INNER JOIN characters ON loots.character_id = characters.id WHERE characters.main = true AND loots.equipped = true and slot is NOT NULL and slot = '#{i.slot}' GROUP BY slot ORDER BY slot").to_f
    end
    @recent_loot = @character.loots.where("item_id IS NOT NULL AND received_on IS NOT NULL").order("received_on DESC")
  end
  
  def use_cached_file?(file)
    return false unless File.exists?(file)
      
    last_modified_time = File.mtime(file)
    now = Time.now
    difference_in_days = (now - last_modified_time) / 60 / 60 / 24
    
    return difference_in_days < 1
  end
  
  def update
    @character = Character.find_by_name(params[:id])
    api = Battlenet.new :us
      
    response_string = ""
    if use_cached_file?(Rails.public_path + "/cache/character.#{@character.to_param}.json")
      File.open(Rails.public_path + "/cache/character.#{@character.to_param}.json", "r") do |f|
        f.each { |line| response_string += line }
      end
    else
      response_string = api.character(@character.server, @character.name, :fields => "items,feed,progression,quests,talents").to_json

      File.open(Rails.public_path + "/cache/character.#{@character.to_param}.json", "w") do |f|
        f.write(response_string)
      end
    end

    json_character = JSON.parse(response_string)

    average_item_level = json_character["items"]["averageItemLevel"]
    average_equipped_item_level = json_character["items"]["averageItemLevelEquipped"]
    
    @character.item_level = average_item_level
    @character.equipped_item_level = average_equipped_item_level
    
    @character.updated_at = Time.now
    @character.save
    
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
    
    json_character["feed"].each do |feed|
      if feed["type"] == "LOOT" then
        timestamp = Time.at(feed["timestamp"].to_s.chop.chop.chop.to_i)
        item_id = feed["itemId"]

        if File.exists?(Rails.public_path + "/cache/item.#{item_id}.json")
          item_string = File.read(Rails.public_path + "/cache/item.#{item_id}.json")
        else
          item_string = api.item(item_id).to_json
          
          File.open(Rails.public_path + "/cache/item.#{item_id}.json", "w") do |f|
            f.write(item_string)
          end
        end

        item = Item.where("armory_id = ?", item_id).first
                
        if not item
          item = api.item(item_id)
          item_name = item["name"]
          item_level =item["itemLevel"]
          item_quality = item["quality"]

          item = Item.new :name => item_name, :level => item_level, :armory_id => item_id
          item.save
        else
          json_item = JSON.parse(item_string)
          
          item.quality = json_item["quality"]
          item.slot = inventoryType[json_item["inventoryType"]]
          
          item.save
        end
        
        # TODO - I Need to determine how to handle the situation
        # where a character receives an item via the armory
        # and then has the item manually changed on the site
        # and then the armory is re-imported. I don't want that
        # character to receive the item again from the import ...
        loot = Loot.where("item_id = ? and character_id = ? and DATE(received_on) = DATE(?)", item.id, @character.id, timestamp).first
        
        if not loot then
          loot = Loot.new(character: @character, item: item, received_on: timestamp, equipped: false, disenchanted: false)
          loot.save
        end
      end
    end
    @character.equipped_items.update_all(:equipped => false)
    slots = ["head", "neck", "shoulder", "back", "chest", "wrist", "hands", "waist", "legs", "feet", "finger1", "finger2", "trinket1", "trinket2", "mainHand", "offHand", "ranged"]
    
    slots.each do |slot|
      next if not json_character["items"][slot]
      item_id = json_character["items"][slot]["id"]
      
      response_string = ""
      if File.exists?(Rails.public_path + "/cache/item.#{item_id}.json")
        File.open(Rails.public_path + "/cache/item.#{item_id}.json", "r") do |f|
          f.each { |line| response_string += line }
        end
      else
        response_string = api.item(item_id).to_json
        
        File.open(Rails.public_path + "/cache/item.#{item_id}.json", "w") do |f|
          f.write(response_string)
        end
      end
      
      json_item = JSON.parse(response_string)
      
      item = Item.where("armory_id = ?", item_id).first
      
      if not item
        item_name = json_item["name"]
        item_level = json_item["itemLevel"]

        item = Item.new :name => item_name, :level => item_level, :slot => slot, :armory_id => item_id
      else
        item.quality = json_item["quality"]
        item.slot = inventoryType[json_item["inventoryType"]]
      end

      item.save
      
      loot = Loot.where("item_id = ? and character_id = ?", item.id, @character.id).first

      if loot
        loot.item = item
        loot.equipped = true
      else
        loot = @character.loots.build
        loot.item = item
        loot.equipped = true
      end
      
      loot.received_on = DateTime.now if loot.received_on.nil?
        
      loot.save unless loot.item.nil?

    end
      
    redirect_to @character
  end
end
