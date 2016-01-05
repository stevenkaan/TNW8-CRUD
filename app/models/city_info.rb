class CityInfo < ActiveRecord::Base
  belongs_to :city
  mount_uploader :city_audio, CityAudioUploader
end
