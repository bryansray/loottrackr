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
end
