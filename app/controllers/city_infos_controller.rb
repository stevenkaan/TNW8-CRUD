class CityInfosController < ApplicationController

	before_filter :authorize
	
	def index
	end

	def show
		@city_info = CityInfo.find(params[:id])
		@city = City.find(@city_info.city_id)
	end

	def edit
		@city_info = CityInfo.find(params[:id])
		@city = City.find(@city_info.city_id)
	end

	def create
	    @city = City.find(params[:city_id])
	    @city_info = @city.city_infos.create(city_info_params)
	    redirect_to city_path(@city)
	end

	def update
		@city_info = CityInfo.find(params[:id])

		if @city_info.update(city_info_params)
			@city = City.find(@city_info.city_id)
			redirect_to @city
		else
			render 'edit'
		end
	end

	def deleteCityAudio
		@city_info = CityInfo.find(params[:id])
		@city_info.remove_city_audio!
		@city_info.save

		redirect_to @city_info
	end

	def destroy
		@city_info = CityInfo.find(params[:id])
		@city = City.find(@city_info.city_id)
		@city_info.destroy
		redirect_to @city
	end

	private
		def city_info_params
			params.require(:city_info).permit(:body, :language, :city_audio)
		end
end
