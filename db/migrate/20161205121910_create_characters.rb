class CreateCharacters < ActiveRecord::Migration
  def change
    create_table :characters do |t|
      t.string  :name
      t.string  :gender
      t.string  :species
      t.integer :species_id
      t.string  :homeplanet
      t.integer :homeplanet_id
      t.string  :profession
      t.integer :user_id
      t.text    :backstory

      t.timestamps null:false
    end
  end
end
