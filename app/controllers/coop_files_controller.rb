class CoopFilesController < ApplicationController
    before_action :authenticate_member!

    def index
        @cooperative = Cooperative.find(params[:cooperative_id])
        return_if_false_coop
        @files_grouped = @cooperative.fileclips.group_by(&:file_category)
    end

    def show
        @cooperative = Cooperative.find(params[:cooperative_id])
        return_if_false_coop
        @files = @cooperative.fileclips.where('file_category_id = ?', params[:id])
        @category = FileCategory.find(params[:id])
    end

    private
        def return_if_false_coop
            if @cooperative.id != current_member.cooperative_id
                redirect_to cooperative_path(@cooperative)
            end
        end
end
