class MarkersController < ApplicationController
	def index
	end

	def show
		@marker = Marker.find(params[:id])
	end

	def create
	    @city = City.find(params[:city_id])
	    @marker = @city.markers.create(marker_params)
	    redirect_to city_path(@city)
  	end
 
	private
	def marker_params
		params.require(:marker).permit(:name)
	end
end
