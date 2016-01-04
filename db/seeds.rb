# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#     t.string :name
#     t.string :email
# t.string :password_digest
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# rake db:drop db:create db:migrate db:setup

user = User.create([{name: 'Nico van den Helm', email: 'nico@sightguide.nl', password: '@-loginpwd', password_confirmation: '@-loginpwd'}])
country = Country.create([{country_name_nld: 'Nederland', country_name_eng: 'The netherlands', country_name_esp: 'Holanda'}])
