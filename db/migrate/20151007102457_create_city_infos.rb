class CreateCityInfos < ActiveRecord::Migration
  def change
    create_table :city_infos do |t|
      t.text :body
      t.string :language
      t.references :city, index: true, foreign_key: true

      t.timestamps
    end
  end
end
