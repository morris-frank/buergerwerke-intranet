class CreateGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :groups do |t|
      t.string :name
      t.boolean :visible

      t.timestamps
    end

    add_index :groups, :name, unique: true


    create_join_table :groups, :users do |t|
      t.index [:member_id, :group_id]
    end
  end
end
