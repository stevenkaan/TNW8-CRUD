class ApiController < ApplicationController

	respond_to :json, :xml
	def getCities

	@cities = City.all();
	# @counties = Country.all();

	#render :json => @cities.to_json(:only => [ :id, :city_name ])

	result = [];

	for city in @cities
		country = Country.where(id: city.country_id)
		# country: country[0].country_name_eng,
		if city.get_languages != 'none'
			result.push({id: city.id, name: city.city_name, country: country[0].country_name_eng, languages: city.get_languages});
		end
		# result.push({city: city})
	end

	render :json => result.to_json


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
		
		country = Country.where(id: @city[0].country_id)
		city_info = CityInfo.where(city_id: @city[0].id, language: 'nld');
		
		a.push( id: @city[0].id, name: city_info[0].name, info: city_info[0].body, country: country[0].country_name_nld, image_1: @city[0].city_images.url, image_2: @city[0].city_images_2.url, image_3: @city[0].city_images_3.url, image_4: @city[0].city_images_4.url );

		for marker in @markers
			marker_info = MarkerInfo.where(marker_id: marker.id, language: 'nld');
			b.push( id: marker.id, name: marker_info[0].name, info: marker_info[0].body,type: marker.marker_type, latitude: marker.marker_lat, longitude: marker.marker_lng, image_1: marker.marker_images.url, image_2: marker.marker_images_2.url, image_3: marker.marker_images_3.url, image_4: marker.marker_images_4.url );
		end
		
		for route in @routes
			c.push( id: route.id, name: route.name_nld, info: route.info_nld, distance: route.afstand, markers: route.return_markers);
		end

	end

	if language == 'eng' 

		country = Country.where(id: @city[0].country_id)
		a.push( id: @city[0].id, name: @city[0].city_name, country: country[0].country_name_eng, image_1: @city[0].city_images.url, image_2: @city[0].city_images_2.url, image_3: @city[0].city_images_3.url, image_4: @city[0].city_images_4.url );

		for marker in @markers
			b.push( id: marker.id, name: marker.name, type: marker.marker_type, latitude: marker.marker_lat, longitude: marker.marker_lng, image_1: marker.marker_images.url, image_2: marker.marker_images_2.url, image_3: marker.marker_images_3.url, image_4: marker.marker_images_4.url );
		end
		
		for route in @routes
			c.push( id: route.id, name: route.name_eng, info: route.info_eng, distance: route.afstand, markers: route.return_markers);
		end

	end

	if language == 'esp'
		
		country = Country.where(id: @city[0].country_id)
		city_info = CityInfo.where(city_id: @city[0].id, language: 'esp');
		
		a.push( id: @city[0].id, name: city_info[0].name, info: city_info[0].body, country: country[0].country_name_esp, image_1: @city[0].city_images.url, image_2: @city[0].city_images_2.url, image_3: @city[0].city_images_3.url, image_4: @city[0].city_images_4.url );

		for marker in @markers
			marker_info = MarkerInfo.where(marker_id: marker.id, language: 'esp');
			b.push( id: marker.id, name: marker_info[0].name, info: marker_info[0].body,type: marker.marker_type, latitude: marker.marker_lat, longitude: marker.marker_lng, image_1: marker.marker_images.url, image_2: marker.marker_images_2.url, image_3: marker.marker_images_3.url, image_4: marker.marker_images_4.url );
		end
		
		for route in @routes
			c.push( id: route.id, name: route.name_esp, info: route.info_esp, distance: route.afstand, markers: route.return_markers);
		end

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