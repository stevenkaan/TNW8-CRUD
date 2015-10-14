class AddMarkerImagesToMarkers < ActiveRecord::Migration
  def change
    add_column :markers, :marker_images, :json
    add_column :marker_infos, :marker_audio, :json
  end
end
