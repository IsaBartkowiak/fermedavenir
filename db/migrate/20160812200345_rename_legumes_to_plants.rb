class RenameLegumesToPlants < ActiveRecord::Migration
  def change
    rename_table  :legumes, :plants
    rename_column :generations, :legume_id, :plant_id
    rename_column :portions, :legume_id, :plant_id
  end
end
