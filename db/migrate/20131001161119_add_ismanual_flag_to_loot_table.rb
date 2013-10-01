class AddIsmanualFlagToLootTable < ActiveRecord::Migration
  def change
    add_column :loots, :is_manual_assignment, :boolean
    add_column :items, :quality, :integer
  end
end
