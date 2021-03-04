require 'open-uri'

# DESTROY OLD SEEDS
puts "🗑 Destroying old seeds..."
puts "> card_recipiente..."
CardRecipient.destroy_all

puts "> cards..."
Card.destroy_all

puts "> profiles..."
Profile.destroy_all

puts "> users..."
User.destroy_all


# ASSETS
puts "Fetching assets..."
CATEGORIES = ['action', 'request', 'info', 'offer', 'question']

uri_ana = URI.parse("https://images.pexels.com/photos/4672553/pexels-photo-4672553.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500")
avatar_ana = open(uri_ana)

uri_sebastian = URI.parse("https://images.pexels.com/photos/91227/pexels-photo-91227.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260")
avatar_sebastian = open(uri_sebastian)

uri_achim = URI.parse("https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260")
avatar_achim = open(uri_achim)

uri_magnus = URI.parse("https://images.pexels.com/photos/1181391/pexels-photo-1181391.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500")
avatar_magnus = open(uri_magnus)

uri_cassandra = URI.parse("https://images.pexels.com/photos/774095/pexels-photo-774095.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260")
avatar_cassandra = open(uri_cassandra)

uri_claudia = URI.parse("https://images.pexels.com/photos/1082962/pexels-photo-1082962.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260")
avatar_claudia = open(uri_claudia)

uri_cat = URI.parse("https://images.pexels.com/photos/20787/pexels-photo.jpg?auto=compress&cs=tinysrgb&dpr=2&w=500")
picture_cat = open(uri_cat)


# CREATING COMMUNITY
puts "Creating a loveley community..."
my_community = Community.create(address: "Dircksenstraße 117, 10178 Berlin")


# CREATING PROFILES
puts "Creating impressive profiles now..."
ana_profile = Profile.create(floor: "VH, 3.OG", phone_number: "123456789123", about: "You probably know me because I accept my own parcels, so sorry for that! 😇 I’m a nurse and usually work crazy shifts and leave for work when you guys are asleep and vice versa... I live in this house for 5 months now and thought it’s really time to get to know you guys and girls! Hope we’ll get a little closer or at least we figure out our hot parcel mess a little better! xoxo")
ana_profile.avatar.attach(io: avatar_ana, filename: 'avatar-ana.jpg', content_type: 'image/jpg')

sebastian_profile = Profile.create(floor: "HH, EG", phone_number: "123456789123")
sebastian_profile.avatar.attach(io: avatar_sebastian, filename: 'avatar-sebastian.jpg', content_type: 'image/jpg')

achim_profile = Profile.create(floor: "VH, 5.OG", phone_number: "123456789123", about: "I came to Berlin 7 years ago for my studies and fell in love with the city ever since. I’ve lived in different districts, Schoeneberg, Neukoelln and now here with you in Kreuzberg!In my free time I like to play music, go bouldering, hang out at Victoriapark or just get away from the city to go kayaking in Spreewald. If you’d like to hang out shoot me a Whatsapp or just stop me in the hallway the old-fashioned and way nicer way 😉!")
achim_profile.avatar.attach(io: avatar_achim, filename: 'avatar-achim.jpg', content_type: 'image/jpg')

cassandra_profile = Profile.create(floor: "VH, 1.OG")
cassandra_profile.avatar.attach(io: avatar_magnus, filename: 'avatar-magnus.jpg', content_type: 'image/jpg')

magnus_profile = Profile.create(floor: "HH, 2.OG", phone_number: "123456789123", about: "Hey there, nice to meet you!")
magnus_profile.avatar.attach(io: avatar_cassandra, filename: 'avatar-cassandra.jpg', content_type: 'image/jpg')

claudia_profile = Profile.create(floor: "HH, 4.OG", phone_number: "123456789123", about: "Hey neighbors!")
claudia_profile.avatar.attach(io: avatar_claudia, filename: 'avatar-claudia.jpg', content_type: 'image/jpg')


# CREATING USERS
puts "Creating users now..."
puts "> 💁 Creating Ana..."
ana = User.new(email: "ana@garcia.com", password: "123456", first_name: "Ana", last_name: "Garcia")
ana.profile = ana_profile
ana.community = my_community
ana.save

puts "> 💁 Creating Seb..."
sebastian = User.new(email: "seb@hummels.com", password: "123456", first_name: "Sebastian", last_name: "Hummels")
sebastian.profile = sebastian_profile
sebastian.community = my_community
sebastian.save

puts "> 💁 Creating Achim..."
achim = User.new(email: "achim@achim.com", password: "123456", first_name: "Achim", last_name: "Peters")
achim.profile = achim_profile
achim.community = my_community
achim.save

puts "> 💁 Creating Cassandra..."
cassandra = User.new(email: "ca@cassandra.com", password: "123456", first_name: "Cassandra", last_name: "Darley")
cassandra.profile = cassandra_profile
cassandra.community = my_community
cassandra.save

puts "> 💁 Creating Magnus..."
magnus = User.new(email: "magnus@friedrich.com", password: "123456", first_name: "Magnus", last_name: "Friedrich")
magnus.profile = magnus_profile
magnus.community = my_community
magnus.save

puts "> 💁 Creating Magnus..."
claudia = User.new(email: "claudi@gmail.com", password: "123456", first_name: "Cassandra", last_name: "Hinrichsen")
claudia.profile = claudia_profile
claudia.community = my_community
claudia.save


# CREATING CARDS
puts "Creating community cards..."
puts ">Card 1..."
card_one = Card.create(board: "community", category: "action", title: "Let's make our backyard pretty", description: "Lovely neighbors, actually our backyard could be super nice if we moved the trash canisters in the corner where the motorcycles are and used the space to make it greener and probably also add some benches and tables where we could meet in summer. This would be a super cool project to start when it’s getting warmer so we could already enjoy our cool backyard this summer and host some barbecues! 🍻 What do you think??", start_date: "Feb 11", start_time: "15PM", user: achim)
CardRecipient.create(user: sebastian, card: card_one)
CardRecipient.create(user: ana, card: card_one)
CardRecipient.create(user: magnus, card: card_one)
CardRecipient.create(user: cassandra, card: card_one)
CardRecipient.create(user: claudia, card: card_one)

puts ">Card 2..."
card_two = Card.create(board: "community", category: "info", title: "Yayyy, It's my Bday!", description: "Hey guys, it's my birthday the upcoming weekend so I'm sorry if it's going to be a little loud a little late... We'll try our best! Drop by for a beer if you feel like it!", start_date: "Feb 06", start_time: "8 PM", user: sebastian)
CardRecipient.create(user: magnus, card: card_two)
CardRecipient.create(user: cassandra, card: card_two)
CardRecipient.create(user: claudia, card: card_two)

puts "Creating parcel cards..."
puts ">Card 3..."
card_three = Card.create(board: "parcels", category: "info", title: "Got yo parcel!", start_date: "Feb 02", start_time: "12 PM", end_date: "Feb 02", end_time: "6 PM", user: achim)
CardRecipient.create(user: ana, card: card_three)

puts ">Card 4..."
card_four = Card.create(board: "parcels", category: "info", title: "I got your parcel!", description: "Hey there, got your parcel. Just come by in the time specified above or let me know when it suits you better.", start_date: "12Febr", start_date: "Feb 01", start_time: "8 AM", end_date: "Feb 01", end_time: "8 PM", user: claudia)
CardRecipient.create(user: achim, card: card_four)

puts ">Card 5..."
card_five = Card.create(board: "parcels", category: "question", title: "Did you get my parcel?", description: "The delivery gut didn't leave a note, I only know that the parcel is supposed to be on your floor.. Did you get it?", user: magnus)
CardRecipient.create(user: sebastian, card: card_five)
CardRecipient.create(user: ana, card: card_five)


puts "Creating mutual help cards..."

puts ">Card 6..."
card_six = Card.create(board: "mutual_help", category: "request", title: "HELP! Need WIFI!", description: "Urgent! I’ll switch my WIFI provider and would need to bridge one afternoon without having any connection! Please let me know if I can use yours. Thank you.", start_date: "Feb 02", start_time: "08 AM", end_time: "6 PM", user: cassandra)
CardRecipient.create(user: ana, card: card_six)
CardRecipient.create(user: sebastian, card: card_six)
CardRecipient.create(user: claudia, card: card_six)

puts ">Card 7..."
card_seven = Card.create(board: "mutual_help", category: "question", title: "Has anybody seen my cat? 😿", description: "Alert, alert! My cat is gone since five days already! That happens sometimes but usually he comes back after 3 days max... I am really worried! Please let me know if you see him. He's called Jimmy! This is what he looks like:", start_date: "Jan 28", user: ana)
card_seven.pictures.each do |photo|
  photo.attach(io: picture_cat, filename: 'picture-cat.jpg', content_type: 'image/jpg')
end
CardRecipient.create(user: sebastian, card: card_seven)
CardRecipient.create(user: achim, card: card_seven)
CardRecipient.create(user: magnus, card: card_seven)
CardRecipient.create(user: cassandra, card: card_seven)
CardRecipient.create(user: claudia, card: card_seven)

puts ">Card 8..."
card_eight = Card.create(board: "mutual_help", category: "request", title: "Tomatos & Bread 4 free", description: "I’m going on vacation tomorrow and still have some leftovers in my fridge! Come get em if you like.", start_date: "Feb 2", user: sebastian)
CardRecipient.create(user: ana, card: card_eight)
CardRecipient.create(user: achim, card: card_eight)
CardRecipient.create(user: magnus, card: card_eight)


puts ">Card 9..."
card_nine = Card.create(board: "mutual_help", category: "request", title: "Anyone got a ladder?", description: "We need to paint our walls and ceilings. Our own ladder is not high enough. Could we get a ladder from anyone? You'll be rewarded with some delicious treats of your choice!", start_date: "Feb 1", start_time: "3 PM", user: claudia)
CardRecipient.create(user: ana, card: card_nine)
CardRecipient.create(user: sebastian, card: card_nine)
CardRecipient.create(user: achim, card: card_nine)
CardRecipient.create(user: magnus, card: card_nine)
CardRecipient.create(user: cassandra, card: card_nine)

# All recipients
# CardRecipient.create(user: ana, card: card_one)
# CardRecipient.create(user: sebastian, card: card_one)
# CardRecipient.create(user: achim, card: card_one)
# CardRecipient.create(user: magnus, card: card_one)
# CardRecipient.create(user: cassandra, card: card_one)
# CardRecipient.create(user: claudia, card: card_one)

puts "You're all set!"
