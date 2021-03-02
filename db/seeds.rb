# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


puts "destroying cards..."
Card.destroy_all
puts "destroying users..."
User.destroy_all
puts "destroying profiles..."
Profile.destroy_all


CATEGORIES = ['action', 'request', 'info', 'offer', 'question']
avatars = ["images/empty-avatar_1.svg", "images/empty-avatar_2.svg", "images/empty-avatar_3.svg", "images/empty-avatar_4.svg"]


puts "Creating a loveleycommunity..."
my_community = Community.create(address: "Dircksenstraße 117, 10178 Berlin")

puts "Creating impressive profiles..."
ana_profile = Profile.create(floor: "VH, 3.OG", phone_number: "123456789123", about: "You probably know me because I accept my own parcels, so sorry for that! 😇 I’m a nurse and usually work crazy shifts and leave for work when you guys are asleep and vice versa... I live in this house for 5 months now and thought it’s really time to get to know you guys and girls! Hope we’ll get a little closer or at least we figure out our hot parcel mess a little better! xoxo")
seb_profile = Profile.create(floor: "HH, EG", phone_number: "123456789123")
achim_profile = Profile.create(floor: "VH, 5.OG", phone_number: "123456789123", about: "I came to Berlin 7 years ago for my studies and fell in love with the city ever since. I’ve lived in different districts, Schoeneberg, Neukoelln and now here with you in Kreuzberg!In my free time I like to play music, go bouldering, hang out at Victoriapark or just get away from the city to go kayaking in Spreewald. If you’d like to hang out shoot me a Whatsapp or just stop me in the hallway the old-fashioned and way nicer way 😉!")

puts "Creating users now..."
puts "Creating Ana..."
ana = User.new(email: "ana@garcia.com", password: "123456", first_name: "Ana", last_name: "Garcia")
ana.profile = ana_profile
ana.community = my_community
ana.save

puts "Creating Seb..."
seb = User.new(email: "seb@hummels.com", password: "123456", first_name: "Seb", last_name: "Hummels")
seb.profile = seb_profile
seb.community = my_community
seb.save

puts "Creating Achim..."
achim = User.new(email: "achim@achim.com", password: "123456", first_name: "Achim", last_name: "Peters")
achim.profile = achim_profile
achim.community = my_community
achim.save

puts "Creating cards..."
puts "Card one..."
card_one = Card.create(board: "community", category: "action", title: "Let's make our backyard pretty", description: "Lovely neighbors, actually our backyard could be super nice if we moved the trash canisters in the corner where the motorcycles are and used the space to make it greener and probably also add some benches and tables where we could meet in summer. This would be a super cool project to start when it’s getting warmer so we could already enjoy our cool backyard this summer and host some barbecues! 🍻 What do you think??", start_date: "11Febr", start_time: "15pm", user: ana)
puts "Card two..."
card_two = Card.create(board: "parcels", category: "info", title: "I got your parcel!", description: "Hey there, got your parcel. Come by in the time above.", start_date: "12Febr", start_time: "15:00", end_date: "12 Febr", end_time: "18:00", user: seb)
puts "Card three..."
card_three = Card.create(board: "parcels", category: "info", title: "Got yo parcel!", start_date: "13Febr", start_time: "15pm", user: achim)
puts "Card four..."
card_four = Card.create(board: "mutual_help", category: "request", title: "HELP! Need WIFI!", description: "Urgent! I’ll switch my WIFI provider and would need to bridge one afternoon without having any connection! Please let me know if I can use yours. Thank you.", start_date: "14Febr", start_time: "15pm", user: seb)

puts "Creating card-cecipients..."
puts "For card one..."
CardRecipient.create(user: achim, card: card_one)
CardRecipient.create(user: seb, card: card_one)

puts "For card two..."
CardRecipient.create(user: achim, card: card_two)
CardRecipient.create(user: ana, card: card_two)

puts "For card three..."
CardRecipient.create(user: seb, card: card_three)

puts "For card four..."
CardRecipient.create(user: ana, card: card_four)

puts "You're all set!"
