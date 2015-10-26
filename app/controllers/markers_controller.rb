class MarkersController < ApplicationController

	before_filter :authorize

	def index
	end

	def show
		@marker = Marker.find(params[:id])
	end

	def edit
		@marker = Marker.find(params[:id])
	end

	def create
	    @city = City.find(params[:city_id])
	    @marker = @city.markers.create(marker_params)
	    redirect_to city_path(@city)
	end

	def update
		@marker = Marker.find(params[:id])

		if @marker.update(marker_params)
			
			redirect_to @marker
		else
			render 'edit'
		end
	end

	def destroy
		@marker = Marker.find(params[:id])
		@city = City.find(@marker.city_id)
		@marker.destroy
		redirect_to @city
	end

	def deleteMarkerImage
		@marker = Marker.find(params[:id])
		@marker.remove_marker_images!
		@marker.save
		redirect_to @marker
	end

	private
		def marker_params
			params.require(:marker).permit(:name, :marker_images)
		end
end
