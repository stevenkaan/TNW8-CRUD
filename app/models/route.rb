class Route < ActiveRecord::Base


	belongs_to :city
	has_and_belongs_to_many(:markers,
    :join_table => "markers_routes",
    :foreign_key => "route_id",
    :association_foreign_key => "marker_id")

    def return_markers ()
 
    	markers_in_route = MarkersRoutes.select(:marker_id).where( route_id: id).order(position: :asc);
    	# markers_in_route.to_json(:only => [ :marker_id ] );
    	result = [];

    	for marker in markers_in_route
    		result.push(marker.marker_id);
    	end

    	result
	end



end
