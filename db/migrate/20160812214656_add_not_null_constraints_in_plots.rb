class AddNotNullConstraintsInPlots < ActiveRecord::Migration
  def change
    change_column :plots, :farm_id, :integer, null: false
  end
end
