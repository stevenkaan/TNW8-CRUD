class ApiController < ApplicationController

	def getCities

		@cities = City.all();

		result = [];

		for city in @cities
			country = Country.where(id: city.country_id)

			if city.get_languages != 'none'
				result.push({id: city.id, name: city.city_name, country: country[0].country_name_eng, languages: city.get_languages});
			end

		end

		render :json => result.to_json

	end

	def getCity

		markers_array = Array.new
		routes_array = Array.new

		language = params[:lang];

		@city = City.where(id: params[:id]);
		
		if @city.length == 0
			render :json => '404'
			return
		end

		@markers = Marker.where(city_id: params[:id]);
		@routes = Route.where(city_id: params[:id]);

		country = Country.where(id: @city[0].country_id)
		city_info = CityInfo.where(city_id: @city[0].id, language: language);

		if language == 'eng' or language == 'nld' or language == 'esp' 	

			for marker in @markers
				marker_info = MarkerInfo.where(marker_id: marker.id, language: language);
				if(marker.marker_lat != nil && marker.marker_lng != nil) 
					markers_array.push( id: marker.id, name: marker_info[0].name, info: marker_info[0].body, type: marker.marker_type, icon_only: marker.icon_only, latitude: marker.marker_lat, longitude: marker.marker_lng, audio: marker_info[0].marker_audio.url, image_1: marker.marker_images.url, image_2: marker.marker_images_2.url, image_3: marker.marker_images_3.url, image_4: marker.marker_images_4.url );
				end
			end
			
			if language == 'nld' 
				for route in @routes
					routes_array.push( id: route.id, name: route.name_nld, info: route.info_nld, distance: route.afstand, multiple_startingpoints: route.multiple_starting_points, markers: route.return_markers);
				end

				result = { id: @city[0].id, name: city_info[0].name, info: city_info[0].body, country: country[0].country_name_nld, image_1: @city[0].city_images.url, image_2: @city[0].city_images_2.url, image_3: @city[0].city_images_3.url, image_4: @city[0].city_images_4.url, markers: markers_array, routes: routes_array };

			end

			if language == 'eng' 
				for route in @routes
					routes_array.push( id: route.id, name: route.name_eng, info: route.info_eng, distance: route.afstand, multiple_startingpoints: route.multiple_starting_points, markers: route.return_markers);
				end

				result = { id: @city[0].id, name: city_info[0].name, info: city_info[0].body, country: country[0].country_name_eng, image_1: @city[0].city_images.url, image_2: @city[0].city_images_2.url, image_3: @city[0].city_images_3.url, image_4: @city[0].city_images_4.url, markers: markers_array, routes: routes_array };

			end

			if language == 'esp'
				for route in @routes
					routes_array.push( id: route.id, name: route.name_esp, info: route.info_esp, distance: route.afstand, multiple_startingpoints: route.multiple_starting_points, markers: route.return_markers);
				end

				result = { id: @city[0].id, name: city_info[0].name, info: city_info[0].body, country: country[0].country_name_esp, image_1: @city[0].city_images.url, image_2: @city[0].city_images_2.url, image_3: @city[0].city_images_3.url, image_4: @city[0].city_images_4.url, markers: markers_array, routes: routes_array };
			end

			
		end

		if @city[0].get_languages.include?(language)
			render :json => {city: result}
		else
		
			render :json => '404'
		end

	end

end