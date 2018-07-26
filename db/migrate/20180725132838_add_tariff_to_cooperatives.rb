class AddTariffToCooperatives < ActiveRecord::Migration[5.2]
  def change
    add_column :cooperatives, :has_tariff, :boolean
  end
end
