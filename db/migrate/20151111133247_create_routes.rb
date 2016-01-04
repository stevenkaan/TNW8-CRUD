class CreateRoutes < ActiveRecord::Migration
  def change
    create_table :routes do |t|
      t.decimal :afstand
      t.references :city, index: true, foreign_key: true
      
      t.timestamps
    end
  end
end
