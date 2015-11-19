class MarkerInfo < ActiveRecord::Base
  belongs_to :marker
  mount_uploader :marker_audio, MarkerAudioUploader
  validates :body, length: { maximum: 300,
  	too_long: "tekst mag niet meer dan %{count} tekens bevatten." }
end
