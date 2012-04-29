class CreateLoots < ActiveRecord::Migration
  def change
    create_table :loots do |t|
      t.references :character
      t.references :item
      
      t.boolean :equipped, :default => false
      t.boolean :disenchanted, :default => false

      t.date :received_on

      t.timestamps
    end
  end
end
