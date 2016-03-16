class AddUserToPaniers < ActiveRecord::Migration
  def change
    add_reference :paniers, :user, index: true, foreign_key: true
  end
end
