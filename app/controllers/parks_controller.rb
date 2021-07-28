class ParksController < ApplicationController

    def index

        parks = Park.all

        render json: parks

    end 


    def show
        
        park = Park.find_by_id(params[:id])

        render json: park


    end 
end
