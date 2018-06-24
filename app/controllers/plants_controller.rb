class PlantsController < ApplicationController
    before_action :authenticate_member!

    def index
        @cooperative = Cooperative.find(params[:cooperative_id])
        @plants = @cooperative.plants
        @current_member_can_edit = current_member_can_edit
    end

    def new
        @cooperative = Cooperative.find(params[:cooperative_id])
        @plants = @cooperative.plants
        @plant = Plant.new

        if !current_member_can_edit
            redirect_to cooperative_plants_path(@cooperative)
        end
    end

    def create
        @cooperative = Cooperative.find(params[:cooperative_id])
        if !current_member_can_edit
            redirect_to cooperative_plants_path(@cooperative)
        end

        @plant = Plant.new(plant_params)
        @plant.cooperative = @cooperative

        if @plant.save
            redirect_to cooperative_plants_path(@cooperative)
        else
            render 'new'
        end
    end

    def edit
        @cooperative = Cooperative.find(params[:cooperative_id])
        if !current_member_can_edit
            redirect_to cooperative_plants_path(@cooperative)
        end
        @plant = Plant.find(params[:id])
    end

    def update
        @cooperative = Cooperative.find(params[:cooperative_id])
        if !current_member_can_edit
            redirect_to cooperative_plants_path(@cooperative)
        end

        @plant = Plant.find(params[:id])
        @plant.cooperative = @cooperative

        if @plant.update(plant_params)
            redirect_to cooperative_plants_path(@cooperative)
        else
            render 'edit'
        end
    end

    def show
        @cooperative = Cooperative.find(params[:cooperative_id])
        @plant = Plant.find(params[:id])
        @current_member_can_edit = current_member_can_edit
    end

    private
    def plant_params
        params.require(:plant).permit(:name, :size, :description, :plant_type)
    end

    def current_member_can_edit
        if @cooperative.id != current_member.cooperative_id
            return false
        end
        if !current_member.is_editor
            return false
        end
        return true
    end
end
