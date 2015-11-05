class ApiController < ApplicationController

	# def getCities

	# 	@cities = City.all();
	# 	cities = {cities:{}};
	# 	temp = {}
		
	# 	for item in @cities
	# 		@city = City.find(item.id)
	# 		temp["languages"] = @city.GetCityLanguages.to_s
	# 		# cities.push(temp);
	# 	end

	# 	render :json => cities.to_json;
	# end

	def getCities

		@cities = City.all();

		jsonReturn = Array.new
		test = Array.new
		# cities => ['steenwijk' => []]

		returnData = {};

		for city in @cities
			test = city.GetCityLanguages
			returnData[city.city_name] = {id:city.id,lang:test}
		end

		render :json => returnData.to_json

		# return languages.to_json.gsub!(/\"/, '\'')

	end

	# def getCities

	# 	@cities = City.all();
	# 	event = {cities:{}};
	# 	city = {languages:{}};
	# 	i = 0;

	# 	temp_storage = '';

	# 	puts('FOR START!!!!!!!!!!!!!!!')
	# 	for item in @cities

	# 		@city = City.find(item.id)



	# 		event['cities'][item.city_name] = {"id": item.id};
	# 		# temp_storage += item.city_name + '":["id":' + item.id.to_json + ',"lang":' + @city.GetCityLanguages.to_json + ']' ;
	# 		# # city.push(@city.GetCityLanguages.to_json)
	# 		# i = i + 1
	# 		# if i != @cities.length
	# 		# 	temp_storage += ',';
	# 		# end
	# 		# temp_storage += city.to_json
	# 	end
	# 	# temp_storage += ']';

	# 	# event['cities'] = temp_storage;

	# 	render :json => event.to_json;
	# end

	def getMarkers
		
		@cities = City.find(params[:id]);
		# @country = Country.find(@cities.county_id);

		json = {"id": @cities.id, "city_name": @cities.city_name, "country": @cities.country.country_name, "markers": @cities.markers};

		render :json => json;
	end

end


	