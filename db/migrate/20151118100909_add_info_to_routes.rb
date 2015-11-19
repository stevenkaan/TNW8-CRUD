class AddInfoToRoutes < ActiveRecord::Migration
  def change
  	add_column :routes, :multiple_starting_points, :bool
  	add_column :routes, :name_nld, :string
  	add_column :routes, :info_nld, :text
  	add_column :routes, :name_eng, :string
  	add_column :routes, :info_eng, :text
  	add_column :routes, :name_esp, :string
  	add_column :routes, :info_esp, :text
  end
end
