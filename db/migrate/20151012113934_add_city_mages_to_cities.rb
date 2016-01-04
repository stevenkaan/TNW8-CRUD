class AddCityMagesToCities < ActiveRecord::Migration
  def change
    add_column :cities, :city_images, :text
    add_column :cities, :city_images_2, :text
    add_column :cities, :city_images_3, :text
    add_column :cities, :city_images_4, :text
    add_column :city_infos, :city_audio, :text
  end
end
