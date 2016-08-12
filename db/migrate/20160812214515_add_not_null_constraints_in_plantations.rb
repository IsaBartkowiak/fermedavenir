class AddNotNullConstraintsInPlantations < ActiveRecord::Migration
  def change
    change_column :plantations, :farm_id, :integer, null: false
    change_column :plantations, :generation_id, :integer, null: false
  end
end
