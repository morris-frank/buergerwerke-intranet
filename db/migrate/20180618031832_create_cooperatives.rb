class CreateCooperatives < ActiveRecord::Migration[5.2]
  def change
    create_table :cooperatives do |t|
      t.string :name,               null: false, default: ""
      t.string :email,              null: false, default: ""
      t.string :address,            default: ""
      t.string :additional_board,   default: ""
      t.text   :description,        default: ""
      t.string :website,            null: true
      t.float  :latitude,           null: true
      t.float  :longitude,          null: true
      t.string :coopnumber,         null: false

      t.timestamps
    end

    add_index :cooperatives, :email, unique: true

    change_table :users do |t|
      t.belongs_to :cooperative, index: true
    end
  end
end
