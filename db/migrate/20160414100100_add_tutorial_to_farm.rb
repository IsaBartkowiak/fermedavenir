class AddTutorialToFarm < ActiveRecord::Migration
  def change
    add_column :farms, :tutorial, :boolean, default: true
  end
end
