class AddStatutToUser < ActiveRecord::Migration
  def change
    add_column :users, :statut, :string, default: "farmer"
  end
end
