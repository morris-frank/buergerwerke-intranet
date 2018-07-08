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
    end
end
