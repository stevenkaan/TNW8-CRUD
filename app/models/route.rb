class Route < ActiveRecord::Base
	belongs_to :city
	has_and_belongs_to_many(:markers,
    :join_table => "markers_routes",
    :foreign_key => "route_id",
    :association_foreign_key => "marker_id")
end
