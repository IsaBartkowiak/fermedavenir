class AddTitleToParcelles < ActiveRecord::Migration
  def change
    add_column :parcelles, :title, :string
  end
end
