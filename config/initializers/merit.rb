# Use this hook to configure merit parameters
Merit.setup do |config|
  # Check rules on each request or in background
  # config.checks_on_each_request = true

  # Add application observers to get notifications when reputation changes.
  # config.add_observer 'MyObserverClassName'

  # Define :user_model_name. This model will be used to grant badge if no
  # `:to` option is given. Default is 'User'.
  # config.user_model_name = 'User'

  # Define :current_user_method. Similar to previous option. It will be used
  # to retrieve :user_model_name object if no `:to` option is given. Default
  # is "current_#{user_model_name.downcase}".
  # config.current_user_method = 'current_user'
end

Merit::Badge.create!(
  id: 1,
  name: "1st card",
  description: "You created your first card!",
  level: "💬"
)

Merit::Badge.create!(
  id: 2,
  name: "Rookie",
  description: "You created at least 5 cards!",
  level:  "👍"
)

Merit::Badge.create!(
  id: 3,
  name: "Writer",
  description: "You created at least 10 cards!",
  level: "📝"
)

Merit::Badge.create!(
  id: 4,
  name: "Socializer",
  description: "You commented at least 10 cards!",
  level: "🎤"
)

Merit::Badge.create!(
  id: 5,
  name: "Popular",
  description: "You commented at least 20 times!",
  level:  "🙌"
)

Merit::Badge.create!(
  id: 6,
  name: "Superstar",
  description: "You commented at least 30 times!",
  level: "⭐️"
)

Merit::Badge.create!(
  id: 7,
  name: "Sharing",
  description: "You created your profile!",
  level: "👋"
)

Merit::Badge.create!(
  id: 8,
  name: "Friendly",
  description: "You commented at least 5 cards!",
  level: "😬"
)

# Merit::Badge.create!(
#   id: 1,
#   name: "Novice",
#   description: "You created your first card!",
#   custom_fields: { difficulty: :bronze }
# )

# Create application badges (uses https://github.com/norman/ambry)
# badge_id = 0
# [{
#   id: (badge_id = badge_id+1),
#   name: 'just-registered'
# }, {
#   id: (badge_id = badge_id+1),
#   name: 'best-unicorn',
#   custom_fields: { category: 'fantasy' }
# }].each do |attrs|
#   Merit::Badge.create! attrs
# end
