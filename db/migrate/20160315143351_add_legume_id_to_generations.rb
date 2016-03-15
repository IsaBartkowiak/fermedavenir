class AddLegumeIdToGenerations < ActiveRecord::Migration
  def change
  	add_column :generations, :legume_id, :integer
  end
end
