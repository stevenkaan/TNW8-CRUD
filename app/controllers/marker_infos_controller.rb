class MarkerInfosController < ApplicationController

	before_filter :authorize
	
	def index
	end

	def show
		@marker_info = MarkerInfo.find(params[:id])
		@marker = Marker.find(@marker_info.marker_id)
	end

	def edit
		@marker_info = MarkerInfo.find(params[:id])
		@marker = Marker.find(@marker_info.marker_id)
	end

	def create
	    @marker = Marker.find(params[:marker_id])
	    @marker_info = @marker.marker_infos.create(marker_info_params)
	    redirect_to @marker_info
	end

	def update
		@marker_info = MarkerInfo.find(params[:id])

		if @marker_info.update(marker_info_params)
			@marker = Marker.find(@marker_info.marker_id)
			redirect_to @marker
		else
			render 'edit'
		end
	end

	def destroy
		@marker_info = MarkerInfo.find(params[:id])
		@marker = Marker.find(@marker_info.marker_id)
		@marker_info.destroy
		redirect_to @marker
	end

	def deleteMarkerAudio
		@marker_info = MarkerInfo.find(params[:id])
		@marker_info.remove_marker_audio!
		@marker_info.save
		redirect_to @marker_info
	end

	private
		def marker_info_params
			params.require(:marker_info).permit(:body, :language, :marker_audio)
		end

end
