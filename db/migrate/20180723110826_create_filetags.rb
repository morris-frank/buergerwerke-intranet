class CreateFiletags < ActiveRecord::Migration[5.2]
  def change
    create_table :filetags do |t|
      t.string :name

      t.timestamps
    end

    create_join_table :fileclips, :filetags do |t|
      t.index [:fileclip_id, :filetag_id]
    end
  end
end
