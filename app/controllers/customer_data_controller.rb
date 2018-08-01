class CustomerDataController < ApplicationController
    before_action :authenticate_member!

    def index
        @cooperative = Cooperative.find(params[:cooperative_id])

        if @cooperative.id != current_member.cooperative_id
            redirect_to cooperative_path(@cooperative)
        end

        if ! current_member.can_see_customer_data
            redirect_to cooperative_path(@cooperative)
        end

        @attributes = [:ra_company, :ra_company_co, :ra_titel, :ra_firstname, :ra_lastname, :ra_street, :ra_zip, :ra_city, :ra_mail, :ls_firstname, :ls_lastname, :ls_street, :ls_zip, :ls_city, :meter_number, :consumption_ht, :consumption_nt, :meter_process, :meter_read_date, :t_id, :accepted_privacy_statement, :status, :deliver_from, :free_from, :provider, :customer_origin, :customer_number, :input_date, :running_number]
        @active_attributes = [:ra_company, :ra_company_co, :ra_titel, :ra_firstname, :ra_lastname]
    end
end
