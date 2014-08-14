# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


House.create([{ 

	title: "Harri's House",
	address: "Almshouse Street, NP253XP",
	latitude: 51.810938,
	longitude: -2.712352,
	price_in_pence: 50000,
	number_of_rooms: 4,
	max_guests: 8,
	is_featured: true,
	user_id: 1

}])