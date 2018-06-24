class CreateGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :groups do |t|
      t.string :name
      t.boolean :visible

      t.timestamps
    end

    add_index :groups, :name, unique: true

    create_table :groups_users, id: false do |t|
      t.integer :member_id, index: true
      t.integer :group_id, index: true

      t.timestamps null:false
    end
  end
end
