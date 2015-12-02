class Marker < ActiveRecord::Base

  belongs_to :city
  has_many :marker_infos
  has_and_belongs_to_many(:markers,
    :join_table => "markers_routes",
    :foreign_key => "marker_id",
    :association_foreign_key => "route_id")
  mount_uploader :marker_images, MarkerImageUploaderUploader
  mount_uploader :marker_images_2, MarkerImageUploaderUploader
  mount_uploader :marker_images_3, MarkerImageUploaderUploader
  mount_uploader :marker_images_4, MarkerImageUploaderUploader
  
  def marker_info_nld
    markers_in_route = MarkerInfo.select(:name, :body, :marker_audio).where( id: 4, language: 'nld');
  end

  def marker_info_eng
    markers_in_route = MarkerInfo.select(:name, :body, :marker_audio).where( id: 4, language: 'eng');
  end

  def marker_info_esp
    markers_in_route = MarkerInfo.select(:name, :body, :marker_audio).where( id: 4, language: 'esp');
  end

end