class RenameStatutInUsers < ActiveRecord::Migration
  def change
    rename_column :users, :statut, :status
  end
end
