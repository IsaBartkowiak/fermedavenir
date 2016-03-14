class FixTypeNameInLegumes < ActiveRecord::Migration
  def change
  	rename_column :legumes, :type, :caracteristique
  end
end
