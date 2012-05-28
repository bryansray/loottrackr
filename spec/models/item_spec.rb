require 'spec_helper'

describe Item do
  it "should be able to tell you if it is heroic or not" do
    item = Item.new :level => 410
    item.should be_heroic
  end
  
  it "should not be heroic" do
    item = Item.new :level => 397
    item.should_not be_heroic
  end
  
  it "should have a unique name" do
    item1 = Item.create :name => "Item 1", :level => 397
    item2 = Item.new :name => "Item 1", :level => 397
    
    item2.should_not be_valid
  end
  
  it "should be case insensitive" do
    item1 = Item.create :name => "Item 1", :level => 397
    item2 = Item.new :name => "item 1", :level => 397
    
    item2.should_not be_valid
  end
  
  it "should not be unique if the item is a different level" do
    item1 = Item.create :name => "Item 1", :level => 397
    item2 = Item.new :name => "Item 1", :level => 410
    
    item2.should be_valid
  end
  
  it "should belong to a specific slot" do
    head_slot = Slot.new(:name => "Head")
    item = Item.create(:name => "Item 1", :slot => head_slot)
    
    item.slot.should == "Head"
  end
end
