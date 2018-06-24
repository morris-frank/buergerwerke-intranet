class CooperativesController < ApplicationController
    before_action :authenticate_member!

    def index
        @cooperatives = Cooperative.all
    end

    def show
        @cooperative = Cooperative.find(params[:id])
        @current_member_can_edit = current_member_can_edit
    end

    private
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
