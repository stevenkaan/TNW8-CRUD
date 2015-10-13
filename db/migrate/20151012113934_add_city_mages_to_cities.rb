class AddCityMagesToCities < ActiveRecord::Migration
  def change
    add_column :cities, :city_images, :json
  end
end
