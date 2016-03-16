class AddPriceToLegumes < ActiveRecord::Migration
  def change
    add_column :legumes, :price, :float
  end
end
