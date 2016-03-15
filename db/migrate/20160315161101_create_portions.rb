class CreatePortions < ActiveRecord::Migration
  def change
    create_table :portions do |t|
      t.integer :panier_id
      t.references :legume, index: true, foreign_key: true
      t.references :generation, index: true, foreign_key: true
      t.float :quantity

      t.timestamps null: false
    end
  end
end
