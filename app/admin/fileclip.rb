ActiveAdmin.register Fileclip do
    permit_params :name, :file, :file_category_id, :is_standard, :is_standard_with_tariff,
      cooperative_ids: [],
      fileclips_cooperative_ids: []

    index do
      selectable_column
      id_column
      column :name
      column :file_category
      column :is_standard
      column :is_standard_with_tariff
      actions
    end

    filter :name
    filter :file_category
    filter :is_standard
    filter :is_standard_with_tariff

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
        f.input :is_standard
        f.input :is_standard_with_tariff
        f.input :file_category
        f.input :cooperatives, :as => :select, :input_html => {:multiple => true, :select_all => true}
        f.input :file, as: :file
      end

      f.actions
    end

  end
