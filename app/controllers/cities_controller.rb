class CitiesController < ApplicationController

	before_filter :authorize

	def index
		@city = City.all
	end

	def show
		@city = City.find(params[:id])
	end

	def new
	end

	def edit
		@city = City.find(params[:id])
	end

	def create
		@city = City.new(city_params)

 		@city.save
		redirect_to @city
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
	    @city.destroy
			redirect_to cities_path
	end

	private
		def city_params
			params.require(:city).permit(:city_name, :city_text , :language)
		end
end
