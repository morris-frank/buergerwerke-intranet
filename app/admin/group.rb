ActiveAdmin.register Group do
    permit_params :name, :visible

    index do
      selectable_column
      id_column
      column :name
      toggle_bool_column :visible
      actions
    end

    form do |f|
      f.inputs "Details der Gruppe" do
        f.input :name
        f.input :visible
      end
      f.actions
    end

  end
