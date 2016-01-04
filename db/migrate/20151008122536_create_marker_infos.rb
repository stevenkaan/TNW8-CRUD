class CreateMarkerInfos < ActiveRecord::Migration
  def change
    create_table :marker_infos do |t|
      t.text :body
      t.string :language
      t.references :marker, index: true, foreign_key: true

      t.timestamps
    end
  end
end
