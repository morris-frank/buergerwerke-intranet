class CreateFileclips < ActiveRecord::Migration[5.2]
  def change
    create_table :fileclips do |t|
      t.string :name
      t.belongs_to :file_category, index: true

      t.timestamps
    end

    create_table :file_categories do |t|
      t.string :name
    end


    create_join_table :fileclips, :cooperatives do |t|
      t.index [:fileclip_id, :cooperative_id]
    end

    create_join_table :fileclips, :groups do |t|
      t.index [:fileclip_id, :group_id]
    end
  end
end
