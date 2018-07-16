ActiveAdmin.register Admin do
    permit_params :email, :password, :password_confirmation, :firstname, :lastname

    index do
      selectable_column
      id_column
      column :firstname
      column :lastname
      column :email
      actions
    end

    show do
      attributes_table do
        row :firstname
        row :lastname
        row :email
        row :created_at
        row :updated_at
      end
    end

    filter :firstname
    filter :lastname
    filter :email

    form do |f|
      f.inputs "Admin Details" do
        f.input :firstname
        f.input :lastname
        f.input :email
        f.input :password
        f.input :password_confirmation
      end
      f.actions
    end

  end
