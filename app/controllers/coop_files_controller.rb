class CoopFilesController < ApplicationController
    before_action :authenticate_member!

    def index
        @cooperative = Cooperative.find(params[:cooperative_id])
        @files = @cooperative.fileclips

        if @cooperative.id != current_member.cooperative_id
            redirect_to cooperative_path(@cooperative)
        end
    end
end
