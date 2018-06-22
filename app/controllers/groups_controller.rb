class GroupsController < ApplicationController
    before_action :authenticate_member!

    def index
        @groups = Group.all
    end
end
