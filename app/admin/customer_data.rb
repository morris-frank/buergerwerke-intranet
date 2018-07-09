require 'zip'

ActiveAdmin.register_page "Customer Data" do

    menu priority: 3, label: proc{ I18n.t("active_admin.customer_data") }

    page_action :create, method: :post do
      uploaded_file = params[:zip_file]
      if uploaded_file.nil?
        redirect_to admin_customer_data_path, notice: "You didn't upload a file."
        return
      end
      if uploaded_file.content_type != 'application/zip'
        redirect_to admin_customer_data_path, notice: "You didn't upload a zip file."
        return
      end

      extract_filepath = '/tmp/buergerwerke_upload_customer_data.'

      existing_coops = []
      missing_coops = []

      Zip::File.open(uploaded_file.tempfile) do |zip_file|
        zip_file.each do |entry|
          # Match the filename and extract Projectnumber of Coop and the file extension:
          matches = /(?<coopnumber>[MP]\d{2})_.*(?<extension>xls|pdf)/.match(entry.name)
          # If invalid filename, ignore:
          if !matches
            next
          end
          # Get the corresponding Coop from DB:
          coop = Cooperative.where(coopnumber: matches['coopnumber']).take
          if !coop
            missing_coops.push(matches['coopnumber'])
            next
          end

          existing_coops.push(matches['coopnumber'])
          # The true lets us overwrite existing files:!
          entry.extract(extract_filepath + matches['extension']){ true }
          # Somehow rails assumes ASCII encoding, but we have Umlaute so we force UTF-8:
          filename = matches.to_s.encode("UTF-8", "UTF-8")
          if matches['extension'] == 'pdf'
            coop.customer_data_pdf.attach(io: File.open(extract_filepath + 'pdf', 'rb'), filename: filename, content_type: 'application/pdf')
          else
            coop.customer_data_xls.attach(io: File.open(extract_filepath + 'xls', 'rb'), filename: filename, content_type: 'application/vnd.ms-excel')
          end
        end
      end

      notice_str = ''
      if existing_coops.length > 0
        notice_str += 'Attached files for: '
        notice_str += existing_coops.uniq.to_s.gsub('"', '')
        notice_str += ' '
      end
      if missing_coops.length > 0
        notice_str += 'Did not attach files for missing Cooperatives: '
        notice_str += missing_coops.uniq.to_s.gsub!('"', '')
      end
      redirect_to admin_customer_data_path, notice: notice_str
    end

    content title: proc{ I18n.t("active_admin.customer_data") } do
      form action: admin_customer_data_create_path, title: 'A custom title', method: :post, enctype: 'multipart/form-data', class: 'formtastic' do |f|
        fieldset class: 'inputs' do
          legend do
            span "Kundendaten hochladen"
          end
          f.input :authenticity_token, type: :hidden, name: :authenticity_token, value: form_authenticity_token
          ol do
            li class: 'file input required' do
              f.label 'ZIP Datei auswählen:', class: 'label', for: 'zip_file'
              f.input :zip, type: :file, name: 'zip_file', accept: 'application/zip'
            end
          end
        end
        fieldset clas: 'actions' do
          ol do
            li class: 'action input_action' do
              f.input :submit, type: :submit, value: 'Upload ZIP File'
            end
          end
        end

      end
    end # content
  end
