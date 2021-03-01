# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
CATEGORIES = ['action', 'request', 'info', 'offer', 'question']

my_community = Community.create(address: "Dircksenstraße 117, 10178 Berlin")
ana_profile = Profile.create(floor: "VH, 1.OG", phone_number: "123456789123", about: "Hi, this is a first test")
seb_profile = Profile.create(floor: "HH, 1.EG", phone_number: "123456789123", about: "Hi, this is a second test")
ana = User.new(email: "ana@garcia.com", password: "123456", first_name: "Ana", last_name: "Garcia")
ana.profile = ana_profile
ana.community = my_community
seb = User.new(email: "seb@hummels.com", password: "123456", first_name: "Seb", last_name: "Hummels")
seb.profile = seb_profile
seb.community = my_community
seb.save
ana.save
Card.create(board: "community", category: "action", title: "first card", description: "just 1 test", start_date: "11Febr", start_time: "15pm", user: ana)
Card.create(board: "parcels", category: "request", title: "second card", description: "just 2 test", start_date: "12Febr", start_time: "15pm", user: seb)
Card.create(board: "missed", category: "info", title: "third card", description: "just 3 test", start_date: "13Febr", start_time: "15pm", user: ana)
Card.create(board: "mutual_help", category: "offer", title: "fourth card", description: "just 4 test", start_date: "14Febr", start_time: "15pm", user: seb)
Card.create(board: "community", category: "question", title: "fifth card", description: "just 5 test", start_date: "15Febr", start_time: "15pm", user: seb)
