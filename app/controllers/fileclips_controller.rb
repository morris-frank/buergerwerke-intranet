class FileclipsController < ApplicationController
    before_action :authenticate_member!

    def index
        @cooperative = current_member.cooperative
        @categories = FileCategory.roots
    end

    def show
        @cooperative = current_member.cooperative
        @category = FileCategory.find(params[:id])

        # Get all files for this category
        @files = @category.fileclips.joined_coops
        if @cooperative.has_tariff
            # Narrow down to all files that are standard or belong to this coop but which are not tariff standard
            @files = @files.where('fileclips_cooperatives.cooperative_id = ? or fileclips.is_standard = 1 or fileclips.is_standard_with_tariff = 1', @cooperative.id)
        else
            # Narrow down to all files that are standard or belong to this coop or are tariff standard
            @files = @files.where('(fileclips_cooperatives.cooperative_id = ? or fileclips.is_standard = 1) and fileclips.is_standard_with_tariff = 0', @cooperative.id)
        end
        # Make list of files unique
        @files = @files.distinct
    end
end
