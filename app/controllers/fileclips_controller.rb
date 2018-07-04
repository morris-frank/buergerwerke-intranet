class FileclipsController < ApplicationController
    before_action :authenticate_member!

    def index
        @cooperative = current_member.cooperative
        @cooperative_fileclips = @cooperative.fileclips

        @groups = current_member.groups
    end
end
