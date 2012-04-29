require 'spec_helper'

describe Loot do
  it "should be disenchanted" do
    loot = Loot.new :disenchanted => true
    loot.should be_disenchanted
  end
end
