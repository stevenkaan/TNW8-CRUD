class Marker < ActiveRecord::Base
  belongs_to :city
  has_many :marker_infos
  has_and_belongs_to_many(:markers,
    :join_table => "markers_routes",
    :foreign_key => "marker_id",
    :association_foreign_key => "route_id")
  mount_uploader :marker_images, MarkerImageUploaderUploader
end
