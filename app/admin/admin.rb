ActiveAdmin.register Admin do
    permit_params :email, :password, :password_confirmation

    index do
      selectable_column
      id_column
      column :firstname
      column :lastname
      column :email
      actions
    end

    filter :firstname
    filter :lastname
    filter :email

    form do |f|
      f.inputs "Admin Details" do
        f.input :email
        f.input :password
        f.input :password_confirmation
      end
      f.actions
    end

  end
