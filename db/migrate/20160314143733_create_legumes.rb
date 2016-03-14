class CreateLegumes < ActiveRecord::Migration
  def change
    create_table :legumes do |t|
      t.string :titre
      t.string :variete
      t.string :type
      t.date :date_plantation

      t.timestamps null: false
    end
  end
end
