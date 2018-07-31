class CreateCustomerData < ActiveRecord::Migration[5.2]
  def change
    create_table :customer_data do |t|

      t.string :ra_company
      t.string :ra_company_co
      t.string :ra_titel
      t.string :ra_firstname
      t.string :ra_lastname
      t.string :ra_street
      t.string :ra_zip
      t.string :ra_city
      t.string :ra_mail
      t.string :ls_firstname
      t.string :ls_lastname
      t.string :ls_street
      t.string :ls_zip
      t.string :ls_city
      t.string :meter_number
      t.integer :consumption_ht
      t.integer :consumption_nt
      t.string :meter_process
      t.date :meter_read_date
      t.belongs_to :cooperative, index: true
      t.string :t_id
      t.boolean :accepted_privacy_statement
      t.string :status
      t.date :deliver_from
      t.date :free_from
      t.string :provider
      t.string :customer_origin
      t.integer :customer_number
      t.date :input_date
      t.integer :running_number

      t.timestamps
    end
  end
end
