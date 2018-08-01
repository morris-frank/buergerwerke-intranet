ActiveAdmin.register Plant do
    permit_params :name, :plant_type, :cooperative_id, :peak_power, :annual_generation, :street, :city, :description, :zip

    active_admin_import validate: false,
                        headers_rewrites: { :"Stadt" => :city, :"Mitgliedernummer" => :cooperative_id, :"Mitgliedsnummer" => :cooperative_id, :"coopnumber" => :cooperative_id, :"PLZ" => :zip, :"Postleitzahl" => :zip, :"Typ" => :plant_type, :"Anlagentyp" => :plant_type, :"Peakleistung" => :peak_power, :"Leistung" => :peak_power, :"Größe" => :peak_power, :"Jährliche Erzeugung" => :annual_generation },
                        csv_options: {col_sep: ";" },
                        timestamps: true,
                        template: 'activeadmin/import',
                        template_object: ActiveAdminImport::Model.new(
                          force_encoding: 'UTF-8',
                          headers: "Name, (Stadt, city), (Mitgliedernummer, coopnumber, Mitgliedsnummer), (PLZ, zip, Postleitzahl), (Typ, plant_type, Anlagentyp), (Peakleistung, peak_power, Leistung, Größe), (Jährliche Erzeugung, annual_generation)"
                        ),
                        before_batch_import: ->(importer) {
                          coopnumbers = importer.values_at(:cooperative_id)
                          # replacing coopnumbers with coop ids
                          cooperatives   = Cooperative.where(coopnumber: coopnumbers).pluck(:coopnumber, :id)
                          options = Hash[*cooperatives.flatten] # #{"M002" => 2, "P032" => 4}
                          importer.batch_replace(:cooperative_id, options)
                        }

    index do
      selectable_column
      id_column
      column :name
      column :plant_type
      column :cooperative
      column :peak_power
      column :city
      actions
    end

    filter :name
    filter :plant_type
    filter :cooperative
    filter :city

    form do |f|
      f.inputs "Details der " + Plant.model_name.human do
        f.input :name
        f.input :plant_type
        f.input :cooperative
        f.input :peak_power
        f.input :annual_generation
        f.input :street
        f.input :zip
        f.input :city
        f.input :description
      end
      f.actions
    end

  end
