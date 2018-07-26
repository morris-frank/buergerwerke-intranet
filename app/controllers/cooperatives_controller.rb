class CooperativesController < ApplicationController
    before_action :authenticate_member!

    def index
        @cooperatives = Cooperative.order(:name)
        @markers = Cooperative.pluck(:name, :latitude, :longitude)
        @markers = @markers.collect{|name, latitude, longitude| {:latlng => [latitude, longitude], :popup => name}}
    end

    def show
        @cooperative = Cooperative.find(params[:id])
        @board = calc_board
    end

    def edit
        @cooperative = Cooperative.find(params[:id])
        if !can_edit
            redirect_to @cooperative
        end
    end

    def update
        @cooperative = Cooperative.find(params[:id])
        if !can_edit
            redirect_to @cooperative
        end

        if @cooperative.update(cooperative_params)
            redirect_to @cooperative
        else
            render 'edit'
        end
    end

    def calculator
        @cooperative = Cooperative.find(params[:cooperative_id])
        if !@cooperative.has_tariff
            redirect_to @cooperative
        end
        if @cooperative.id != current_member.cooperative_id
            redirect_to @cooperative
        end
    end

    private
        def cooperative_params
            params.require(:cooperative).permit(:name, :email, :street, :city, :zip, :additional_board, :website, :description)
        end

        def can_edit
            own_coop = @cooperative.id == current_member.cooperative_id
            return own_coop && current_member.is_editor
        end

        def calc_board
            board = @cooperative.additional_board

            @cooperative.members.each do |member|
                if member.is_board_member?
                    board_member_name = member.firstname + ' ' + member.lastname
                    if !board.include? board_member_name
                        board += ', ' + board_member_name
                    end
                end
            end
            return board
        end
end
