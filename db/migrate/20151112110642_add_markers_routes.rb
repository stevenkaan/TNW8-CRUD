class AddMarkersRoutes < ActiveRecord::Migration
  def change
  	create_table :markers_routes, :force => true do |t|
	  	t.integer :marker_id, :null => false
	  	t.integer :route_id, :null => false
	  	t.timestamps
  	end
  end
end
