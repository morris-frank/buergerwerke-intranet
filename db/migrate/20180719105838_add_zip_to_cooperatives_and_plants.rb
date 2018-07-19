class AddZipToCooperativesAndPlants < ActiveRecord::Migration[5.2]
  def change
    add_column :cooperatives, :zip, :string
    add_column :plants, :zip, :string
  end
end
