class CreatePlantations < ActiveRecord::Migration
  def change
    create_table :plantations do |t|
      t.references :farm, index: true, foreign_key: true
      t.references :generation, index: true, foreign_key: true
      t.float :quantity
      t.integer :year

      t.timestamps null: false
    end
  end
end
