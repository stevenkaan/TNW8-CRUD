class CityInfo < ActiveRecord::Base
  belongs_to :city
  mount_uploader :city_audio, CityAudioUploader
  validates :body, length: { maximum: 300,
  	too_long: "tekst mag niet meer dan %{count} tekens bevatten." }
end
