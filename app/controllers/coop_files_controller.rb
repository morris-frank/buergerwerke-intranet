class CoopFilesController < ApplicationController
    before_action :authenticate_member!

    def index
        @cooperative = Cooperative.find(params[:cooperative_id])
        @files_grouped = @cooperative.fileclips.group_by(&:file_category)

        if @cooperative.id != current_member.cooperative_id
            redirect_to cooperative_path(@cooperative)
        end
    end
end
