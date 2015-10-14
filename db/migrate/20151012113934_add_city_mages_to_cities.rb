class AddCityMagesToCities < ActiveRecord::Migration
  def change
    add_column :cities, :city_images, :json
    add_column :city_infos, :city_audio, :json
  end
end
