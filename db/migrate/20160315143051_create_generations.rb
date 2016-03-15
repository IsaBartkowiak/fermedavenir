class CreateGenerations < ActiveRecord::Migration
  def change
    create_table :generations do |t|
      t.integer :semi_from
      t.integer :semi_to
      t.integer :plantation
      t.integer :recolte
      t.integer :conservation_from
      t.integer :conservation_to

      t.timestamps null: false
    end
  end
end
