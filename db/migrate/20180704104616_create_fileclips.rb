class CreateFileclips < ActiveRecord::Migration[5.2]
  def change
    create_table :fileclips do |t|
      t.string :name

      t.timestamps
    end

    create_table :fileclips_cooperatives do |t|
        t.belongs_to :fileclip, index: true
        t.belongs_to :cooperative, index: true
    end

    create_table :fileclips_groups do |t|
        t.belongs_to :fileclip, index: true
        t.belongs_to :group, index: true
    end
  end
end
