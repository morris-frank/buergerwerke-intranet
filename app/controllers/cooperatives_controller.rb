class CooperativesController < ApplicationController
    def index
        @cooperatives = Cooperative.all
    end

    def show
        @cooperative = Cooperative.find(params[:id])
    end
end
