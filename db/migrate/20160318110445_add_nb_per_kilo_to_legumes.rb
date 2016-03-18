class AddNbPerKiloToLegumes < ActiveRecord::Migration
  def change
    add_column :legumes, :nb_per_kilo, :float, default: 1000
  end
end
