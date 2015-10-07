class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|

      t.string :city_name
      t.references :country, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
