require 'spec_helper'

describe Character do
  it "should have looted many items" do
    character = Character.create
    item = Item.create
    loot = Loot.create :item => item, :character => character
    
    character.should have(1).items
  end
  
  it "should be able to equip a specific item", :focus => false do
    head_item = Item.new :name => "Head Item"
    character = Character.new :name => "Bryan"
    character.equip_item :name => "Head Item", :slot => :head
    
    character.should have(1).equipped_items
  end
  
  it "should only be able to have one slot equipped at a time", :focus => false do
	character = Character.new :name => "Bryan"
	
    head_item_1 = character.equipped_items.build :name => "Head Item 1", :slot => 'head'
    head_item_2 = character.equipped_items.build :name => "Head Item 2", :slot => 'head'
    
    character.should have(1).equipped_items
  end
  
  it "should have only specific items equipped", :focus => true do
    character = Character.new

    item1 = Item.new :slot => :head
    item2 = Item.new :slot => :head

    loot = Loot.new :item => item1, :character => character
    loot = Loot.create :item => item2, :character => character, :equipped => true

#     testing = character.loots.includes(:item).where(:items => { :slot => :head })
#     pp testing
    
    character.should have(1).equipped_items
  end
  
  it "should be able to calcuate their gear score" do
    character = Character.create
    item1 = Item.create :level => 410
    item2 = Item.create :level => 410
    loot = Loot.create :item => item1, :character => character, :equipped => true
    loot = Loot.create :item => item2, :character => character, :equipped => true
    
    character.should have(2).equipped_items
    character.gear_level.should == 410
  end
  
  it "should average out all the equipped items" do
    character = Character.create
    item1 = Item.create :level => 410
    item2 = Item.create :level => 397
    loot = Loot.create :item => item1, :character => character, :equipped => true
    loot = Loot.create :item => item2, :character => character, :equipped => true
    
    character.gear_level.should == 403.5
  end
  
  it "should return zero if there is no equipped items" do
    character = Character.create
    item1 = Item.create :level => 410
    item2 = Item.create :level => 397
    loot = Loot.create :item => item1, :character => character
    loot = Loot.create :item => item2, :character => character
    
    character.gear_level.should == 0
  end
  
  it "should return true if there is no item equipped in the specified slot" do
    character = Character.new
    character.should be_free_slot_for(:head)
  end
  
  it "should return false if the character has an item equipped in that slot" do
    head_slot_item = Item.new :slot => Slot.new(:name => "Head")
    character = Character.new :equipped_items => [head_slot_item]
    
    character.should_not be_free_slot_for(:head)
  end
end
