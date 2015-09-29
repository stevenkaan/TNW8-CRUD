class FixColumnName < ActiveRecord::Migration
  def change
  	rename_column :cities, :city_name, :name
  	rename_column :cities, :city_info, :info
  end
end
