class AddLngLatToMarkers < ActiveRecord::Migration
  def change
  	add_column :markers, :marker_lng, :float
  	add_column :markers, :marker_lat, :float
  end
end
