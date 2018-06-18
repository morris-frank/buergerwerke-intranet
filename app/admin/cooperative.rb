ActiveAdmin.register Cooperative do
    permit_params :email, :name, :address

    index do
      selectable_column
      id_column
      column :name
      column :address
      column :email
      column :additional_board
      actions
    end

    filter :name
    filter :address
    filter :email

    form do |f|
      f.inputs "Cooperative Details" do
        f.input :email
        f.input :name
        f.input :address
      end
      f.actions
    end

  end
