class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.integer :level
      t.string :dropped_by
      t.string :slot, :item_type
      t.integer :wowhead_id
      
      # t.references :slot

      t.timestamps
    end
  end
end
