class MarkerInfo < ActiveRecord::Base
  belongs_to :marker
  mount_uploader :marker_audio, MarkerAudioUploader
end
