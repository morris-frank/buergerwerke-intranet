class PlantsController < ApplicationController
    before_action :authenticate_member!

    def index
        @cooperative = Cooperative.find(params[:cooperative_id])
        @plants = @cooperative.plants.order('name ASC')
        @markers = @plants.pluck(:name, :latitude, :longitude)
            .reject{|name, latitude, longitude| latitude == nil || longitude == nil}
            .collect{|name, latitude, longitude| {:latlng => [latitude, longitude], :popup => name}}
    end

    def show
        @cooperative = Cooperative.find(params[:cooperative_id])
        @plant = Plant.find(params[:id])
    end

    def new
        @cooperative = Cooperative.find(params[:cooperative_id])
        @plants = @cooperative.plants
        @plant = Plant.new

        if !can_edit
            redirect_to cooperative_plants_path(@cooperative)
        end
    end

    def create
        @cooperative = Cooperative.find(params[:cooperative_id])
        if !can_edit
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
        if !can_edit
            redirect_to cooperative_plants_path(@cooperative)
        end
        @plant = Plant.find(params[:id])
    end

    def update
        @cooperative = Cooperative.find(params[:cooperative_id])
        if !can_edit
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

    private
        def plant_params
            params.require(:plant).permit(:name, :peak_power, :city, :street, :zip, :description, :plant_type)
        end

        def can_edit
            own_coop = @cooperative.id == current_member.cooperative_id
            return own_coop && current_member.is_editor
        end
end
