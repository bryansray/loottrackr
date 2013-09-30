require 'pp'
require 'json'

class CharactersController < ApplicationController
  def show
    @character = Character.find(params[:id])
    # @grouped_loot = @character.loots.where("item_id IS NOT NULL AND received_on IS NOT NULL").order("received_on DESC").group("MONTH(received_on)")
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
    @character = Character.find(params[:id])
    api = Battlenet.new :us
      
    response_string = ""
    if use_cached_file?(Rails.public_path + "/cache/character.#{params[:id]}.json")
      File.open(Rails.public_path + "/cache/character.#{params[:id]}.json", "r") do |f|
        f.each { |line| response_string += line }
      end
    else
      response_string = api.character(@character.server, @character.name, :fields => "items,feed,progression,quests,talents").to_json

      File.open(Rails.public_path + "/cache/character.#{params[:id]}.json", "w") do |f|
        f.write(response_string)
      end
    end

    json_character = JSON.parse(response_string)

    average_item_level = json_character["items"]["averageItemLevel"]
    average_equipped_item_level = json_character["items"]["averageItemLevelEquipped"]
    
    @character.item_level = average_item_level
    @character.equipped_item_level = average_equipped_item_level
    
    @character.save
    
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

          item = Item.new :name => item_name, :level => item_level, :armory_id => item_id
          item.save
        end
        
        loot = Loot.where("item_id = ? and character_id = ? and DATE(received_on) = DATE(?)", item.id, @character.id, timestamp).first
        
        if not loot then
          loot = Loot.new(character: @character, item: item, received_on: timestamp, equipped: false, disenchanted: false)
          loot.save
        end
      end
    end
    
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
        item.save
      end
      
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
