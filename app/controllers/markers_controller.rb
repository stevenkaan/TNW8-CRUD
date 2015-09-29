class MarkersController < ApplicationController
	def index
	end
	def create
		render plain: params[:marker].inspect
	end
end
