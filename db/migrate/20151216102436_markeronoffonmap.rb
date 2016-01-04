class Markeronoffonmap < ActiveRecord::Migration
  def change
  	add_column :markers, :icon_only, :boolean
  end
end
