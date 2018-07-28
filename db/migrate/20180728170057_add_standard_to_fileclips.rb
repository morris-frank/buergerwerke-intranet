class AddStandardToFileclips < ActiveRecord::Migration[5.2]
  def change
    add_column :fileclips, :is_standard, :boolean, null: false, default: false
    add_column :fileclips, :is_standard_with_tariff, :boolean, null: false, default: false
  end
end
