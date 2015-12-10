class CreateCountries < ActiveRecord::Migration
  def change
    create_table :countries do |t|
      t.string :country_name_nld

      t.timestamps
    end
  end
end

#rake db:drop db:create db:migrate db:seed
