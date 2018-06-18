ActiveAdmin.register Group do
    permit_params :name

    index do
      selectable_column
      id_column
      column :name
      actions
    end

    form do |f|
      f.inputs "Group Details" do
        f.input :name
      end
      f.actions
    end

  end
