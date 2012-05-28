require 'spec_helper'

describe Slot do
  it "should have a lot of items that fit this slot" do
    slot = Slot.new
    slot.should have(0).items
  end
end
