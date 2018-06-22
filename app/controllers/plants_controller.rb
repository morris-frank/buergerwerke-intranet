class PlantsController < ApplicationController
    before_action :authenticate_member!

    def index
        @cooperative = Cooperative.find(params[:cooperative_id])
        @plants = @cooperative.plants
    end

    def show
        @cooperative = Cooperative.find(params[:cooperative_id])
        @plant = Plant.find(params[:id])
    end
end
