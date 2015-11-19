class PositionToRoutesMarkers < ActiveRecord::Migration
  def change
  	add_column :markers_routes, :position, :int
  end
end
