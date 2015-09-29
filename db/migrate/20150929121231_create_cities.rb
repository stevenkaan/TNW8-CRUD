class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.string :city_name
      t.text :city_info

      t.timestamps
    end
  end
end
