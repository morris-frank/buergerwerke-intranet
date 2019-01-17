class MembersController < ApplicationController
    before_action :authenticate_member!

    def index
        @cooperative = Cooperative.find(params[:cooperative_id])
        @members = @cooperative.members.order(:lastname)
    end

    def update
        @cooperative = Cooperative.find(params[:cooperative_id])
        if !is_admin
            redirect_to cooperative_members_path(@cooperative)
        end

        for member_params in params[:member] do
            member = Member.find(member_params[0])
            if ! member.is_coop_admin
                member.update(member_params[1].permit(:is_board_member, :is_editor, :can_see_customer_data))
            end
        end
        redirect_to cooperative_members_path(@cooperative)
    end

    private
        def is_admin
            own_coop = @cooperative.id == current_member.cooperative_id
            return own_coop && current_member.is_coop_admin
        end
end
