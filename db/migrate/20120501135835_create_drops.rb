class CreateDrops < ActiveRecord::Migration
  def change
    create_table :drops do |t|
      t.references :boss
      t.references :item
      
      t.date :dropped_on

      t.timestamps
    end
  end
end
