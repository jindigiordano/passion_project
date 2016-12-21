class CreateCharacters < ActiveRecord::Migration
  def change
    create_table :characters do |t|
      t.string  :name
      t.string  :gender
      t.string  :species
      t.string  :homeplanet
      t.string  :class
      t.string  :vehicle
      t.string  :starship
      t.integer :user_id
      t.text    :backstory

      t.timestamps null:false
    end
  end
end
