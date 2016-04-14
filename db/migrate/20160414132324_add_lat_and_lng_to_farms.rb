class AddLatAndLngToFarms < ActiveRecord::Migration
  def change
    add_column :farms, :lat, :float
    add_column :farms, :lng, :float
  end
end
