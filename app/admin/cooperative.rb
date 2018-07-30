ActiveAdmin.register Cooperative do
    permit_params :email, :name, :street, :city, :description, :additional_board, :website, :coopnumber, :zip, :has_tariff

    headers_rewrites =  { :"mail" => :email, :"Stadt" => :city, :"Homepage" => :website, :"Mitgliedernummer" => :coopnumber, :"Mitgliedsnummer" => :coopnumber, :"PLZ" => :zip, :"Postleitzahl" => :zip, :"HatTarif" => :has_tariff, :"MitTarif" => :has_tariff }

    active_admin_import validate: false,
                        headers_rewrites: headers_rewrites,
                        csv_options: {col_sep: "," },
                        timestamps: true,
                        template: 'activeadmin/import',
                        template_object: ActiveAdminImport::Model.new(
                          force_encoding: 'UTF-8',
                          headers: (headers_rewrites.keys + headers_rewrites.values).uniq.to_s.gsub!(':', '')
                        )

    index do
      selectable_column
      id_column
      column :coopnumber
      column :name
      column :has_tariff
      column :city
      actions
    end

    filter :coopnumber
    filter :name
    filter :has_tariff
    filter :city

    show do
      attributes_table do
        row :coopnumber
        row :name
        row :email
        row :has_tariff
        row :city
        row :zip
        row :street
        row :additional_board
        row :website
        row :latitude
        row :longitude
        row :description
        row :customer_data_pdf do |ad|
          if ad.customer_data_pdf.attached?
            link_to 'Anzeigen', rails_blob_path(ad.customer_data_pdf)
          end
        end
        row :customer_data_xls do |ad|
          if ad.customer_data_xls.attached?
            link_to 'Anzeigen', rails_blob_path(ad.customer_data_xls)
          end
        end
      end
    end

    form do |f|
      f.inputs "Details der " + Cooperative.model_name.human do
        f.input :email
        f.input :coopnumber
        f.input :name
        f.input :has_tariff
        f.input :street
        f.input :zip
        f.input :city
        f.input :additional_board
        f.input :website
        f.input :description
      end
      f.actions
    end

  end
