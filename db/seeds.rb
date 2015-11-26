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

# users = User.create([{name: 'Friso', password: 'f', email: 'f@f.nl'}])
countries = Country.create({country_name: 'Nederland'}, {country_name: 'Duitsland'}, {country_name: 'Belgie'})
cities = City.create([{city_name: 'Groningen', country: 1}, {city_name: 'Leeuwarden', country: 1}, {city_name: 'Zwolle', country: 1}])
# markers = Marker.create({name: 'Peerd van ome Loeks', city: 1}, {name: 'Vis markt', city: 1}, {name: 'Peerd van ome Loeks', city: 1})