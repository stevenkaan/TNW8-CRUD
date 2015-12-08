class City < ActiveRecord::Base

	belongs_to :country
	has_many :markers
	has_many :city_infos
	has_many :routes
	mount_uploader :city_images, CityImageUploader
	mount_uploader :city_images_2, CityImageUploader
	mount_uploader :city_images_3, CityImageUploader
	mount_uploader :city_images_4, CityImageUploader

	def get_languages

		city_info = CityInfo.where(city_id: id);

		languages = Array.new

		for item in city_info
			
			if languages.index(item.language) == nil
				if item.name.to_s.length > 0
					if item.body.to_s.length > 0
						languages.push(item.language);
					end
				end
			end

		end

		if languages.length != 0
			return languages
		end

		return 'none'
	end

end
 