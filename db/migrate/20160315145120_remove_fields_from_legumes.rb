class RemoveFieldsFromLegumes < ActiveRecord::Migration
  def change
  	remove_column :legumes, :semi_deb
  	remove_column :legumes, :semi_fin
  	remove_column :legumes, :temps_pousse_min
  	remove_column :legumes, :temps_pousse_max
  end
end
