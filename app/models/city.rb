class City < ActiveRecord::Base

	belongs_to :country
	has_many :markers
	has_many :city_infos
	has_many :routes
	mount_uploader :city_images, CityImageUploader

	def GetCityLanguages()

		city_info = CityInfo.where(city_id: id);

		languages = Array.new

		for item in city_info
			
			if languages.index(item.language) == nil
				languages.push(item.language);
			end

		end

		if languages.length != 0
			# return languages.to_json.gsub!(/\"/, '\'')
			puts('LANFGNGNGNGGNGNnnn')
			puts(languages.to_s)
			return languages.to_s.gsub!(/\"/, '\'')
		end
		return 'none'
	end

end
