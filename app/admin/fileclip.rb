ActiveAdmin.register Fileclip do
    permit_params :name, :file,
      group_ids: [],
      fileclips_group_ids: [],
      cooperative_ids: [],
      fileclips_cooperative_ids: []

    index do
      selectable_column
      id_column
      column :name
      actions
    end

    show do
      attributes_table do
        row :name
        # row :file do |ad|
        #   link_to 'Anzeigen', rails_blob_path(ad.file)
        # end
      end
    end

    form do |f|
      f.inputs "Fileclip Details" do
        f.input :name
        f.input :cooperatives, :as => :select, :input_html => {:multiple => true}
        f.input :groups, :as => :select, :input_html => {:multiple => true}
        f.input :file, as: :file, input_html: { multiple: true }
      end

      f.actions
    end

  end
