# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
my_community = Community.create(address: "Dircksenstraße 117, 10178 Berlin")
ana_profile = Profile.create(floor: "VH, 1.OG", phone_number: "123456789123", about: "Hi, this is a first test")
seb_profile = Profile.create(floor: "HH, 1.EG", phone_number: "123456789123", about: "Hi, this is a second test")
ana = User.new(email: "ana@garcia.com", password: "123456", first_name: "Ana", last_name: "Garcia")
ana.profile = ana_profile
ana.community = my_community
seb = User.new(email: "seb@hummels.com", password: "123456", first_name: "Seb", last_name: "Hummels")
seb.profile = seb_profile
seb.community = my_community
