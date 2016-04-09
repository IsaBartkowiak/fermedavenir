class CreateParcelles < ActiveRecord::Migration
  def change
    create_table :parcelles do |t|
      t.string :location
      t.references :generation, index: true, foreign_key: true
      t.references :farm, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
