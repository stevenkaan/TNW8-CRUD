class AddMarkerImagesToMarkers < ActiveRecord::Migration
  def change
    add_column :markers, :marker_images, :text
    add_column :markers, :marker_images_2, :text
    add_column :markers, :marker_images_3, :text
    add_column :markers, :marker_images_4, :text
    add_column :marker_infos, :marker_audio, :text
  end
end
