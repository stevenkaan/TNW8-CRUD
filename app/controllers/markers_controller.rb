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

	def edit
		@marker = Marker.find(params[:id])

	end

	def update
		@marker = Marker.find(params[:id])

		if @marker.update(marker_params)
			@city = City.find(@marker.city_id)
			redirect_to @city
		else
			render 'edit1'
		end
	end

	def destroy
			@marker = Marker.find(params[:id])
			@city = City.find(@marker.city_id)
			@marker.destroy
			redirect_to @city
	end

	private
		def marker_params
			params.require(:marker).permit(:name)
		end
end
