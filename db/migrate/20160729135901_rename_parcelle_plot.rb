class RenameParcellePlot < ActiveRecord::Migration
  def change
    rename_column :parcelles, :title, :name
    rename_table  :parcelles, :plots
  end
end
