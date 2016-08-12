class RenameSemaineInHampers < ActiveRecord::Migration
  def change
    rename_column :hampers, :semaine, :week
  end
end
