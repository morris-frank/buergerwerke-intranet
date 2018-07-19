ActiveAdmin.register Plant do
    permit_params :name, :plant_type, :cooperative_id, :peak_power, :annual_generation, :street, :city, :description, :zip

    active_admin_import

    index do
      selectable_column
      id_column
      column :name
      column :plant_type
      column :cooperative
      column :peak_power
      column :city
      actions
    end

    filter :name
    filter :plant_type
    filter :cooperative
    filter :city

    form do |f|
      f.inputs "Details der Anlage" do
        f.input :name
        f.input :plant_type
        f.input :cooperative
        f.input :peak_power
        f.input :annual_generation
        f.input :street
        f.input :city
        f.input :zip
        f.input :description
      end
      f.actions
    end

  end
