class CreatePlants < ActiveRecord::Migration[5.2]
  def change
    create_table :plants do |t|
      t.string :name
      t.integer :plant_type
      t.float :size
      t.float :longitude
      t.float :latitude
      t.text :description
      t.belongs_to :cooperative, index: true

      t.timestamps
    end
  end
end
