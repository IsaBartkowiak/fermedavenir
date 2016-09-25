class RenameTypeInPlants < ActiveRecord::Migration
  def change
    rename_column :plants, :type, :kind
  end
end
