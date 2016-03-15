class CreatePaniers < ActiveRecord::Migration
  def change
    create_table :paniers do |t|
      t.integer :semaine

      t.timestamps null: false
    end
  end
end
