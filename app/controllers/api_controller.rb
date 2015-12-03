class ApiController < ApplicationController

	respond_to :json, :xml
	def getCities

	@cities = City.all();

	render :json => @cities.to_json(:only => [ :id, :country_id, :city_name ],
		:methods => :get_languages
	)

	end

	def getCity
	result = Array.new
	
	# result['city'] = 'hi'
	language = params[:lang];
	@city = City.where(id: params[:id]);
	@markers = Marker.where(city_id: params[:id]);
	@routes = Route.where(city_id: params[:id]);

	# result.city.push()
	a = Array.new
	b = Array.new
	test = '';
	c = Array.new

	if language == 'nld' 
		a = @city.to_json(:only => [ :id, :country_id, :city_name, :city_images, :city_images_2, :city_images_3, :city_images_4 ]);
		b = @markers.to_json(
			:only => [ :id, :marker_type, :name, :marker_images, :marker_images_2, :marker_images_3, :marker_images_4, :marker_lng, :marker_lat ],
				:methods => :marker_info_nld
		)
		b = b.gsub! '_nld', ''
		c = @routes.to_json(:only => [ :afstand, :multiple_starting_points, :name_nld, :info_nld ],
			:methods => :return_markers
		)
		c = c.gsub! '_nld', ''
	end

	if language == 'eng' 
		a = @city.to_json(:only => [ :id, :country_id, :city_name, :city_images, :city_images_2, :city_images_3, :city_images_4 ]);
		b = @markers.to_json(
			:only => [ :id, :marker_type, :name, :marker_images, :marker_images_2, :marker_images_3, :marker_images_4, :marker_lng, :marker_lat ],
				:methods => :marker_info_eng
		)
		b = b.gsub! '_eng', ''
		c = @routes.to_json(:only => [ :afstand, :multiple_starting_points, :name_eng, :info_eng ],
			:methods => :return_markers
		)
		c = c.gsub! '_eng', ''
	end

	if language == 'esp'
		a = @city.to_json(:only => [ :id, :country_id, :city_name, :city_images, :city_images_2, :city_images_3, :city_images_4 ]);
		b = @markers.to_json(
			:only => [ :id, :marker_type, :name, :marker_images, :marker_images_2, :marker_images_3, :marker_images_4, :marker_lng, :marker_lat ],
				:methods => :marker_info_esp
		)
		b = b.gsub! '_esp', ''
		c = @routes.to_json(:only => [ :afstand, :multiple_starting_points, :name_esp, :info_esp ],
			:methods => :return_markers
		)
		c = c.gsub! '_esp', ''
	end

	result = [city: a, markers: b, routes: c];

	render :json => result

	end

	respond_to :json, :xml
	def getMarkers

	@markers = Marker.where(city_id: params[:id]);

	render :json => @markers.to_json(
		:only => [ :id, :city_id, :marker_images ],
			:include => { :marker_infos => { :only => [:language, :id, :name, :body, :marker_audio] } }
	)

	end

	respond_to :json, :xml
	def getRoutes

	@routes = Route.where(city_id: params[:id]);

	render :json => @routes.to_json(:only => [ :id, :afstand, :multiple_starting_points, :name_nld, :name_eng, :name_esp ],
		# :include =>  {:markers_routes => { :only => [:marker_id] } }
		:methods => :return_markers
	 )

	end

end


	