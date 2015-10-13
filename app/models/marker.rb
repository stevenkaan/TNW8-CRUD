class Marker < ActiveRecord::Base
  belongs_to :city
  has_many :marker_infos
  mount_uploader :marker_images, MarkerImageUploaderUploader
  mount_uploader :marker_audio, MarkerAudioUploader
end
