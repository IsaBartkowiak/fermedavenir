class RenamePanierToHamper < ActiveRecord::Migration
  def change
    rename_table  :paniers, :hampers
    rename_column :portions, :panier_id, :hamper_id
  end
end
