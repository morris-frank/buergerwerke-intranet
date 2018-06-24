class CooperativesController < ApplicationController
    before_action :authenticate_member!

    def index
        @cooperatives = Cooperative.all
    end

    def show
        @cooperative = Cooperative.find(params[:id])
        @current_member_can_edit = current_member_can_edit
        @current_member_cooperative = @cooperative.id == current_member.cooperative_id
    end

    def edit
        @cooperative = Cooperative.find(params[:id])
        if !current_member_can_edit
            redirect_to @cooperative
        end
    end

    def update
        @cooperative = Cooperative.find(params[:id])
        if !current_member_can_edit
            redirect_to @cooperative
        end

        if @cooperative.update(cooperative_params)
            redirect_to @cooperative
        else
            render 'edit'
        end
    end

    private
    def cooperative_params
        params.require(:cooperative).permit(:name, :email, :address, :additional_board, :website, :description)
    end

    def current_member_can_edit
        if @cooperative.id != current_member.cooperative_id
            return false
        end
        if !current_member.is_editor
            return false
        end
        return true
    end
end
