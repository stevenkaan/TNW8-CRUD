class PagesController < ApplicationController

	def pageNotFound
		render :json => '404'
	end

end
