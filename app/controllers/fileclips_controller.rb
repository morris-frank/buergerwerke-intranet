class FileclipsController < ApplicationController
    before_action :authenticate_member!

    def index
        @cooperative = current_member.cooperative
        @cooperative_fileclips_grouped = @cooperative.fileclips.group_by(&:file_category)
    end
end
