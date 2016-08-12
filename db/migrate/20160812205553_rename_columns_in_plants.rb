class RenameColumnsInPlants < ActiveRecord::Migration
  def change
    rename_column :plants, :titre, :name
    rename_column :plants, :variete, :type
    rename_column :plants, :caracteristique, :feature
  end
end
