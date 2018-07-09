ActiveAdmin.register Cooperative do
    permit_params :email, :name, :address, :description, :longitude, :latitude, :additional_board, :website, :coopnumber, :customer_data_xls, :customer_data_pdf

    index do
      selectable_column
      id_column
      column :coopnumber
      column :name
      column :address
      actions
    end

    filter :name
    filter :address
    filter :email

    form do |f|
      f.inputs "Cooperative Details" do
        f.input :email
        f.input :coopnumber
        f.input :name
        f.input :address
        f.input :additional_board
        f.input :website
        f.input :latitude
        f.input :longitude
        f.input :description
        f.input :customer_data_xls, as: :file
        f.input :customer_data_pdf, as: :file
      end
      f.actions
    end

  end
