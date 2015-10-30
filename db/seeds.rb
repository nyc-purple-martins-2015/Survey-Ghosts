3.times do User.create!(
  username: Faker::Internet.user_name,
  password_digest: "password"
  )
end
# Survey 1
Survey.create!(
  title: "Halloween Opinions",
  description: "Preferences for Halloween Fun",
  author_id: 1
  )

Question.create!(
  query: "What is your preferred halloween costume?",
  survey_id: 1
  )

Question.create!(
  query: "Where is the best place to go on Halloween?",
  survey_id: 1
  )

Option.create!(
  response: "Cat",
  question_id: 1
  )

Option.create!(
  response: "Donald Trump",
  question_id: 1
  )

Option.create!(
  response: "Dead Amy Winehouse",
  question_id: 1
  )

Option.create!(
  response: "Rick",
  question_id: 1
  )

Option.create!(
  response: "Haunted house",
  question_id: 2
  )

Option.create!(
  response: "House party",
  question_id: 2
  )

Option.create!(
  response: "To the clurrrb",
  question_id: 2
  )

Option.create!(
  response: "Trick or treating",
  question_id: 2
  )

# Survey 2
Survey.create!(
  title: "Animals",
  author_id: 2
  )

Question.create!(
  query: "What is your favorite animal?",
  survey_id: 2
  )

Question.create!(
  query: "Favorite Zoo",
  survey_id: 2
  )

Option.create!(
  response: "Kitty Cat",
  question_id: 1
  )

Option.create!(
  response: "Cheetah",
  question_id: 1
  )

Option.create!(
  response: "Dolphin",
  question_id: 1
  )

Option.create!(
  response: "Sloth",
  question_id: 1
  )

Option.create!(
  response: "Bronx",
  question_id: 2
  )

Option.create!(
  response: "Central Park Zoo",
  question_id: 2
  )

Option.create!(
  response: "Sydney Zoo",
  question_id: 2
  )

Option.create!(
  response: "Nashville Zoo",
  question_id: 2
  )