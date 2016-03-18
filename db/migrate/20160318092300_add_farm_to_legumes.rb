class AddFarmToLegumes < ActiveRecord::Migration
  def change
    add_reference :legumes, :farm, index: true, foreign_key: true
  end
end
