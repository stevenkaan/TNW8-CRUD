class AddCityMagesToCities < ActiveRecord::Migration
  def change
    add_column :cities, :city_images, :json
    add_column :cities, :city_audio, :json
  end
end
