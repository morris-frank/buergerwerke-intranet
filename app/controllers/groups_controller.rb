class GroupsController < ApplicationController
    before_action :authenticate_member!

    def index
        @groups = Group.where('visible = ?', true)
    end

    def show
        @group = Group.find(params[:id])
    end
end
