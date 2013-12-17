class CreateGuilds < ActiveRecord::Migration
  def change
    create_table :guilds do |t|
    	t.string :name
    	t.boolean :active

      t.timestamps
    end
  end
end
