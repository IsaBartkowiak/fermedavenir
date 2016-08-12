class TranslateGenerationColumns < ActiveRecord::Migration
  def change
    rename_column :generations, :semi_from, :seedling_from
    rename_column :generations, :semi_to, :seedling_to
    rename_column :generations, :recolte, :harvest
    rename_column :generations, :conservation_to, :available_for
  end
end
