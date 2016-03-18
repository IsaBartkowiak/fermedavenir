class AddFarmToGenerations < ActiveRecord::Migration
  def change
    add_reference :generations, :farm, index: true, foreign_key: true
  end
end
