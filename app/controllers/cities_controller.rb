class CitiesController < ApplicationController

	before_filter :authorize

	def index
	end

	def show
		begin
			@city = City.find(params[:id])
			@city_info_array = CityInfo.where("city_id = " + params[:id])
		rescue ActiveRecord::RecordNotFound => e
			render :json => '404'
			return
		end
	end

	def edit
		@city = City.find(params[:id])
	end

	def create
		@county = Country.find(params[:country_id])
		@city = @county.cities.create(city_params)
		@city.city_infos.create(:name => '',:body => '', :language => 'nld', :city_audio => '' , :ready => false)
	    @city.city_infos.create(:name => city_params['city_name'],:body => '', :language => 'eng', :city_audio => '', :ready => false)
	    @city.city_infos.create(:name => '',:body => '', :language => 'esp', :city_audio => '', :ready => false)
	    flash[:success] = "Stad succesvol aangemaakt!"
		redirect_to @city
	end

	def update
  		@city = City.find(params[:id])
  		@city_info_array = CityInfo.where("city_id = " + params[:id])

  		if @city.update(city_params)

  			if(city_info_eng_params['city_info_name_eng'].length != 0)
  				@city.update_attributes(:city_name => city_info_eng_params['city_info_name_eng'])
				@city_info_array[0].update_attributes(:name => city_info_nld_params['city_info_name_nld'], :body => city_info_nld_params['city_info_text_nld'], :city_audio => city_info_nld_params['city_info_audio_nld'], :ready => city_info_nld_params['ready_nld'])
				@city_info_array[1].update_attributes(:name => city_info_eng_params['city_info_name_eng'], :body => city_info_eng_params['city_info_text_eng'], :city_audio => city_info_eng_params['city_info_audio_eng'], :ready => city_info_eng_params['ready_eng'])
				@city_info_array[2].update_attributes(:name => city_info_esp_params['city_info_name_esp'], :body => city_info_esp_params['city_info_text_esp'], :city_audio => city_info_esp_params['city_info_audio_esp'], :ready => city_info_esp_params['ready_esp'])

				flash[:success] = "Stad succesvol opgeslagen!"
  			end

    		redirect_to @city

  		else

  			flash[:success] = "Fout bij het opslaan van de stad!"
    		redirect_to @city
  		end
	end

	def destroy
	    @city = City.find(params[:id])
	    @country = Country.find(@city.country_id)

	    for cityinfo in @city.city_infos
	    	cityinfo.delete()
	    end

	    for marker in @city.markers
	    	marker.delete()
	    end

	    for route in @city.routes
	    	route.delete()
	    end

	    @city.destroy
	    flash[:success] = "Stad succesvol verwijderd!"
		redirect_to @country
	end

	def deleteCityImage
		@city = City.find(params[:id])
		@city.remove_city_images!
		@city.save
		redirect_to @city
	end

	def deleteCityImage2
		@city = City.find(params[:id])
		@city.remove_city_images_2!
		@city.save
		redirect_to @city
	end

	def deleteCityImage3
		@city = City.find(params[:id])
		@city.remove_city_images_3!
		@city.save
		redirect_to @city
	end

	def deleteCityImage4
		@city = City.find(params[:id])
		@city.remove_city_images_4!
		@city.save
		redirect_to @city
	end

	private
		def city_params
			params.require(:city).permit(:city_name, :city_images, :city_images_2, :city_images_3, :city_images_4)
		end

	private
		def city_info_nld_params
			params.require(:city).permit(:city_info_name_nld ,:city_info_text_nld, :city_info_audio_nld, :ready_nld)
		end

	private
		def city_info_eng_params
			params.require(:city).permit(:city_info_name_eng ,:city_info_text_eng, :city_info_audio_eng, :ready_eng)
		end

	private
		def city_info_esp_params
			params.require(:city).permit(:city_info_name_esp ,:city_info_text_esp, :city_info_audio_esp, :ready_esp)
		end
end
