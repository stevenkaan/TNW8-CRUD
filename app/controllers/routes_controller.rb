class RoutesController < ApplicationController

	def index
	end

	def show

		begin
			@route = Route.find(params[:id])
		rescue ActiveRecord::RecordNotFound => e
			render :json => '404'
			return
		end

		@city = City.find(@route.city_id)

		@markers_not_in_route = unique
		@markers_in_route =  @route.markers.order("position ASC")

		if(params[:marker] and params[:type])

			if params[:type] == 'delete'
				MarkersRoutes.destroy_all("route_id = " + @route.id.to_s + " AND marker_id = " + params[:marker])
				redirect_to @route
			end

			if params[:type] == 'add'
				max_position = MarkersRoutes.maximum("position")
				if max_position == nil
					max_position = 0
				end
				MarkersRoutes.create(:marker_id => params[:marker], :route_id => @route.id, :position => max_position+1)
				redirect_to @route
			end

			if params[:type] == 'up'

				@marker_route = MarkersRoutes.find_by marker_id: params[:marker], route_id: @route.id
				@target_marker_route = MarkersRoutes.find_by position: (@marker_route.position - 1), route_id: @route.id
				temp = @marker_route.position

				if @target_marker_route != nil
					MarkersRoutes.where("route_id = " + @route.id.to_s + " AND marker_id = " + @marker_route.marker_id.to_s).update_all(position: @target_marker_route.position)
					MarkersRoutes.where("route_id = " + @route.id.to_s + " AND marker_id = " + @target_marker_route.marker_id.to_s).update_all(position: temp)
				end

			end

			if params[:type] == 'down'

				@marker_route = MarkersRoutes.find_by marker_id: params[:marker], route_id: @route.id
				@target_marker_route = MarkersRoutes.find_by position: (@marker_route.position + 1), route_id: @route.id
				temp = @marker_route.position

				if @target_marker_route != nil
					MarkersRoutes.where("route_id = " + @route.id.to_s + " AND marker_id = " + @marker_route.marker_id.to_s).update_all(position: @target_marker_route.position)
					MarkersRoutes.where("route_id = " + @route.id.to_s + " AND marker_id = " + @target_marker_route.marker_id.to_s).update_all(position: temp)
				end

			end
		end
	end

	def edit
		@route = Route.find(params[:id])
	end

	def create
	    @city = City.find(params[:city_id])
	    @route = @city.routes.create(route_params)

	    flash[:success] = "Route succesvol aangemaakt!"
	    redirect_to @route
	end

	def update
		@route = Route.find(params[:id])
		if(route_params['name_eng'].length != 0)
			if @route.update(route_params)

				flash[:success] = "Route succesvol opgeslagen!"
				redirect_to @route
			else
				render 'edit'
			end
		else
			redirect_to @route
		end
	end

	def destroy
		@route = Route.find(params[:id])
		@city = City.find(@route.city_id)

		@markersRoutes = MarkersRoutes.where(route_id: params[:id]);

		for marker in @markersRoutes
	    	marker.delete()
	    end

		@route.destroy
		flash[:success] = "Route succesvol verwijdered!"
		redirect_to @city
	end

	private
		def unique
			@route = Route.find(params[:id])
			@city = City.find(@route.city_id)

			@markers_in_route = []

			for item in @city.markers
				if @route.markers.include? item

				else
					@marker = Marker.find(item)
					@markers_in_route.push(@marker)
				end


			end

			@markers_in_route

		end

	private
		def add_to_route_params
			params.permit(:marker, :route)
		end

	private
		def route_params
			params.require(:route).permit(:afstand, :path, :multiple_starting_points, :name_nld, :info_nld, :name_eng, :info_eng, :name_esp, :info_esp)
		end
end
