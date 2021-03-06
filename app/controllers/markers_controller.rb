class MarkersController < ApplicationController

	before_filter :authorize

	def index
	end

	def show
		begin
			@marker = Marker.find(params[:id])
			@marker_info_array = MarkerInfo.where("marker_id = " + params[:id])
		rescue ActiveRecord::RecordNotFound => e
			render :json => '404'
			return
		end
	end

	def edit
		@marker = Marker.find(params[:id])
	end

	def create
	    @city = City.find(params[:city_id])
	    @marker = @city.markers.create(marker_params)

	    @marker.marker_infos.create(:name => '',:body => '', :language => 'nld', :marker_audio => '')
	    @marker.marker_infos.create(:name => marker_params['name'],:body => '', :language => 'eng', :marker_audio => '')
	    @marker.marker_infos.create(:name => '',:body => '', :language => 'esp', :marker_audio => '')
	    flash[:success] = "Bezienswaardigheid succesvol aangemaakt!"
	    redirect_to @marker
	end

	def update
		@marker = Marker.find(params[:id])
		@marker_info_array = MarkerInfo.where("marker_id = " + params[:id])

		if @marker.update(marker_params)

			if(marker_info_eng_params['marker_info_name_eng'].length != 0)

				@marker.update_attributes(:name => marker_info_eng_params['marker_info_name_eng'])
				@marker_info_array[0].update_attributes(:name => marker_info_nld_params['marker_info_name_nld'], :body => marker_info_nld_params['marker_info_text_nld'], :marker_audio => marker_info_nld_params['marker_info_audio_nld'])
				@marker_info_array[1].update_attributes(:name => marker_info_eng_params['marker_info_name_eng'], :body => marker_info_eng_params['marker_info_text_eng'], :marker_audio => marker_info_eng_params['marker_info_audio_eng'])
				@marker_info_array[2].update_attributes(:name => marker_info_esp_params['marker_info_name_esp'], :body => marker_info_esp_params['marker_info_text_esp'], :marker_audio => marker_info_esp_params['marker_info_audio_esp'])
			
				flash[:success] = "Bezienswaardigheid succesvol opgeslagen!"
			end
			redirect_to @marker

		else
			flash[:success] = "Fout bij het opslaan van de bezienswaardigheid!"
			redirect_to @marker
		end
	end

	def destroy
		@marker = Marker.find(params[:id])
		@city = City.find(@marker.city_id)

		for markerinfo in @marker.marker_infos
	    	markerinfo.delete()
	    end

		@marker.destroy

		flash[:success] = "Bezienswaardigheid succesvol verwijderd!"
		redirect_to @city
	end

	def deleteMarkerAudioNld
		@marker = Marker.find(params[:id])
		@marker_info_array = MarkerInfo.where("marker_id = " + params[:id])
		@marker_info_array[0].remove_marker_audio!
		@marker_info_array[0].save
		redirect_to @marker
	end

	def deleteMarkerAudioEng
		@marker = Marker.find(params[:id])
		@marker_info_array = MarkerInfo.where("marker_id = " + params[:id])
		@marker_info_array[1].remove_marker_audio!
		@marker_info_array[1].save
		redirect_to @marker
	end

	def deleteMarkerAudioEsp
		@marker = Marker.find(params[:id])
		@marker_info_array = MarkerInfo.where("marker_id = " + params[:id])
		@marker_info_array[2].remove_marker_audio!
		@marker_info_array[2].save
		redirect_to @marker
	end

	def deleteMarkerImage
		@marker = Marker.find(params[:id])
		@marker.remove_marker_images!
		@marker.save
		redirect_to @marker
	end

	def deleteMarkerImage2
		@marker = Marker.find(params[:id])
		@marker.remove_marker_images_2!
		@marker.save
		redirect_to @marker
	end

	def deleteMarkerImage3
		@marker = Marker.find(params[:id])
		@marker.remove_marker_images_3!
		@marker.save
		redirect_to @marker
	end

	def deleteMarkerImage4
		@marker = Marker.find(params[:id])
		@marker.remove_marker_images_4!
		@marker.save
		redirect_to @marker
	end

	private
		def marker_params
			params.require(:marker).permit(:name, :icon_only, :marker_images, :marker_images_2, :marker_images_3, :marker_images_4, :marker_lng, :marker_lat, :marker_type)
		end

	private
		def marker_info_nld_params
			params.require(:marker).permit(:marker_info_name_nld ,:marker_info_text_nld, :marker_info_audio_nld)
		end

	private
		def marker_info_eng_params
			params.require(:marker).permit(:marker_info_name_eng ,:marker_info_text_eng, :marker_info_audio_eng)
		end

	private
		def marker_info_esp_params
			params.require(:marker).permit(:marker_info_name_esp ,:marker_info_text_esp, :marker_info_audio_esp)
		end
end
