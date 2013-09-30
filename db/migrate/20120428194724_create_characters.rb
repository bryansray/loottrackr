class CreateCharacters < ActiveRecord::Migration
  def change
    create_table :characters do |t|
      t.string :name, :server, :description
      t.string :clazz
      t.boolean :main, :default => true
      
      t.integer :item_level, :equipped_item_level
      t.timestamps
    end
  end
end
