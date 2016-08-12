class RenameLongitudeAndLatitudeInFarms < ActiveRecord::Migration
  def change
    rename_column :farms, :lat, :latitude
    rename_column :farms, :lng, :longitude
  end
end
