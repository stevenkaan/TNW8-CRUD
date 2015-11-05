class AddLngLatToMarkers < ActiveRecord::Migration
  def change
  	add_column :markers, :marker_lng, :float
  	add_column :markers, :marker_lat, :float
  	add_column :marker_infos, :name, :string
  	add_column :city_infos, :name, :string
  end
end
