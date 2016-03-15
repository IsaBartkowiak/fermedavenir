class AddedDefaultToMigrations < ActiveRecord::Migration
  def change
  	 change_column :generations, :semi_from, :integer, :default => 0
  	 change_column :generations, :semi_to, :integer, :default => 0
  end
end
