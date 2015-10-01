class FixColumnName2 < ActiveRecord::Migration
  def change
  	rename_column :markers, :naam, :name
  end
end
