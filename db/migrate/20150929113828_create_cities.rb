class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|

      t.string "city_name"
      t.string "language"
      t.text "city_text"

      t.timestamps null: false
    end
  end
end
