class AddDescriptionToFileCategories < ActiveRecord::Migration[5.2]
  def change
    add_column :file_categories, :description, :text
  end
end
