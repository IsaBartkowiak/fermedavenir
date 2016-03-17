class AddFarmToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :farm, index: true, foreign_key: true
  end
end
