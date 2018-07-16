class MembersController < ApplicationController
    before_action :authenticate_member!

    def index
        @cooperative = Cooperative.find(params[:cooperative_id])
        @members = @cooperative.members.order('lastname ASC')
        @current_member_is_admin = current_member_is_admin
    end

    def update
        @cooperative = Cooperative.find(params[:cooperative_id])
        if !current_member_is_admin
            redirect_to cooperative_members_path(@cooperative)
        end

        member = Member.find(params[:id])
        member.cooperative = @cooperative

        if member.update(member_params)
            redirect_to cooperative_members_path(@cooperative)
        else
            render 'index'
        end
    end

    private
        def member_params
            params.require(:member).permit(:is_board_member, :is_editor, :can_see_customer_data)
        end

        def current_member_is_admin
            if @cooperative.id != current_member.cooperative_id
                return false
            end
            if !current_member.is_coop_admin
                return false
            end
            return true
        end
end
