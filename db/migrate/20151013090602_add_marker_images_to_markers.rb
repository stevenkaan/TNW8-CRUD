class AddMarkerImagesToMarkers < ActiveRecord::Migration
  def change
    add_column :markers, :marker_images, :json
  end
end
