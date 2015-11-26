class AddCityMagesToCities < ActiveRecord::Migration
  def change
    add_column :cities, :city_images, :json
    add_column :cities, :city_images_2, :json
    add_column :cities, :city_images_3, :json
    add_column :cities, :city_images_4, :json
    add_column :city_infos, :city_audio, :json
  end
end
