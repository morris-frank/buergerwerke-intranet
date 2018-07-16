class CreatePlants < ActiveRecord::Migration[5.2]
  def change
    create_table :plants do |t|
      t.string :name
      t.integer :plant_type
      t.float :peak_power
      t.float :annual_generation
      t.float :longitude
      t.float :latitude
      t.string :street
      t.string :city
      t.text :description
      t.belongs_to :cooperative, index: true

      t.timestamps
    end
  end
end
