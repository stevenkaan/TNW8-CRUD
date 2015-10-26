class CitiesController < ApplicationController

	before_filter :authorize

	def index
	end

	def show
		@city = City.find(params[:id])
	end

	def edit
		@city = City.find(params[:id])
	end

	def create
		@county = Country.find(params[:country_id])
		@city = @county.cities.create(city_params)
		redirect_to country_path(@county)
	end

	def update
  		@city = City.find(params[:id])

  		if @city.update(city_params)

    		redirect_to @city
  		else
    		render 'edit'
  		end
	end

	def destroy
	    @city = City.find(params[:id])
	    @country = Country.find(@city.country_id)
	    @city.destroy
		redirect_to @country
	end

	def deleteCityImage
		@city = City.find(params[:id])
		@city.remove_city_images!
		@city.save
		redirect_to @city
	end

	private
		def city_params
			params.require(:city).permit(:city_name, :city_images)
		end
end
