ActiveAdmin.register Fileclip do
    permit_params :name, :file, :file_category_id,
      cooperative_ids: [],
      fileclips_cooperative_ids: [],
      filetag_ids: [],
      fileclips_filetag_ids: []

    index do
      selectable_column
      id_column
      column :name
      column :file_category
      actions
    end

    show do
      attributes_table do
        row :name
        row :file_category
        row :file do |ad|
          link_to 'Anzeigen', rails_blob_path(ad.file)
        end
      end
    end

    form do |f|
      f.inputs Fileclip.model_name.human + " Details" do
        f.input :name
        f.input :file_category
        f.input :cooperatives, :as => :select, :input_html => {:multiple => true, :select_all => true}
        f.input :filetags, :as => :check_boxes
        f.input :file, as: :file
      end

      f.actions
    end

  end
