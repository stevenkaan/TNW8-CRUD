class CountriesController < ApplicationController

	before_filter :authorize
	
	def index
		@countries = Country.all
	end

	def show
		@country = Country.find(params[:id])
	end

	def new
	end

	def edit
		@country = Country.find(params[:id])
	end

	def create
		@country = Country.new(country_params)

 		@country.save
 		flash[:success] = "Land succesvol aangemaakt!"
		redirect_to @country
	end

	def update
  		@country = Country.find(params[:id])

  		if @country.update(country_params)
  			flash[:success] = "Land succesvol opgeslagen!"
    		redirect_to @country
  		else
    		render 'edit'
  		end
	end

	def destroy
	    @country = Country.find(params[:id])
	    
	    for city in @country.cities
	    	city.delete()
	    end
	    @country.destroy
	    flash[:success] = "Land succesvol verwijderd!"
		redirect_to countries_path
	end

	private
		def country_params
			params.require(:country).permit(:country_name_nld, :country_name_eng, :country_name_esp)
		end

end
