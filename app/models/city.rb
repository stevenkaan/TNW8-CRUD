class City < ActiveRecord::Base
	belongs_to :country
	has_many :markers
	has_many :city_infos
end
