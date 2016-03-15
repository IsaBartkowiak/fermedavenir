class RemoveConservationFromFromGenerations < ActiveRecord::Migration
  def change
  	remove_column :generations, :conservation_from
  end
end
