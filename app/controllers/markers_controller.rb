class MarkersController < ApplicationController

	before_filter :authorize

	def index
	end

	def show

		@marker = Marker.find(params[:id])
		@marker_info_array = MarkerInfo.where("marker_id = " + params[:id])
	end

	def edit
		@marker = Marker.find(params[:id])
	end

	def create
	    @city = City.find(params[:city_id])
	    @marker = @city.markers.create(marker_params)

	    @marker.marker_infos.create(:name => 'geen',:body => 'geen', :language => 'nld', :marker_audio => 'geen')
	    @marker.marker_infos.create(:name => 'geen',:body => 'geen', :language => 'eng', :marker_audio => 'geen')
	    @marker.marker_infos.create(:name => 'geen',:body => 'geen', :language => 'esp', :marker_audio => 'geen')

	    redirect_to @marker
	end

	def update
		@marker = Marker.find(params[:id])
		@marker_info_array = MarkerInfo.where("marker_id = " + params[:id])

		if @marker.update(marker_params)

			@marker.update_attributes(:name => marker_info_nld_params['marker_info_name_nld'])
			@marker_info_array[0].update_attributes(:name => marker_info_nld_params['marker_info_name_nld'], :body => marker_info_nld_params['marker_info_text_nld'], :marker_audio => marker_info_nld_params['marker_info_audio_nld'])
			@marker_info_array[1].update_attributes(:name => marker_info_eng_params['marker_info_name_eng'], :body => marker_info_eng_params['marker_info_text_eng'], :marker_audio => marker_info_eng_params['marker_info_audio_eng'])
			@marker_info_array[2].update_attributes(:name => marker_info_esp_params['marker_info_name_esp'], :body => marker_info_esp_params['marker_info_text_esp'], :marker_audio => marker_info_esp_params['marker_info_audio_esp'])
			
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
			params.require(:marker).permit(:name, :marker_images, :marker_lng, :marker_lat, :marker_type)
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
