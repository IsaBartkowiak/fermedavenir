class CreateLegumes < ActiveRecord::Migration
  def change
    create_table :legumes do |t|
      t.string :titre
      t.string :variete
      t.string :type
      t.integer :semi_deb
      t.integer :semi_fin
      t.integer :temps_pousse_min
      t.integer :temps_pousse_max

      t.timestamps null: false
    end
  end
end
