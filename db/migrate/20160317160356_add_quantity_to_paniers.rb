class AddQuantityToPaniers < ActiveRecord::Migration
  def change
    add_column :paniers, :quantity, :integer, default: 20
  end
end
