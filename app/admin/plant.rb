ActiveAdmin.register Plant do
    permit_params :name, :plant_type, :cooperative_id, :size, :description, :longitude, :latitude

    index do
      selectable_column
      id_column
      column :name
      column :plant_type
      column :cooperative
      column :size
      actions
    end

    filter :name
    filter :plant_type
    filter :cooperative
    filter :size

    form do |f|
      f.inputs "Plant Details" do
        f.input :name
        f.input :plant_type
        f.input :cooperative
        f.input :size
        f.input :latitude
        f.input :longitude
        f.input :description
      end
      f.actions
    end

  end
