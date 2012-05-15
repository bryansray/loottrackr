class CreateCharacters < ActiveRecord::Migration
  def change
    create_table :characters do |t|
      t.string :name, :description
      t.string :clazz
      t.boolean :main, :default => true
      
      t.timestamps
    end
  end
end
