ActiveAdmin.register Filetag do
    permit_params :name

    index do
      selectable_column
      column :name
      actions
    end

    filter :name

    form do |f|
      f.inputs "Details der " + Filetag.model_name.human do
        f.input :name
      end
      f.actions
    end

  end
