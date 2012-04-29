require 'spec_helper'

describe Character do
  it "should have looted many items" do
    character = Character.create
    item = Item.create
    loot = Loot.create :item => item, :character => character
    
    character.should have(1).items
  end
  
  it "should have only specific items equipped" do
    character = Character.create
    item1 = Item.create
    item2 = Item.create
    loot = Loot.create :item => item1, :character => character
    loot = Loot.create :item => item2, :character => character, :equipped => true
    
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
end
