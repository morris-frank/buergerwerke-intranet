class AddParentToFileCategories < ActiveRecord::Migration[5.2]
  def change
    add_reference :file_categories, :parent, foreign_key: {to_table: :file_categories}
  end
end
