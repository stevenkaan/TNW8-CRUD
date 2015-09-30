class CreateMarkers < ActiveRecord::Migration
  def change
    create_table :markers do |t|
      t.string :naam
      t.references :city, index: true, foreign_key: true

      t.timestamps
    end
  end
end
