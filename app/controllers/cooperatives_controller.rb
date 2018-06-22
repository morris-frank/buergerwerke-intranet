class CooperativesController < ApplicationController
    before_action :authenticate_member!

    def index
        @cooperatives = Cooperative.all
    end

    def show
        @cooperative = Cooperative.find(params[:id])
    end
end
