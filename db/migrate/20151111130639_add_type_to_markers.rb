class AddTypeToMarkers < ActiveRecord::Migration
  def change
  	add_column :markers, :marker_type, :int
  end
end
