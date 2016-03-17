class AddFarmToPaniers < ActiveRecord::Migration
  def change
    add_reference :paniers, :farm, index: true, foreign_key: true
  end
end
