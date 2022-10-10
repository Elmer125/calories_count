# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

(1..50).each do |i|
  User.create(
    name: "User-#{i}",
    email: "user#{i}@example.com",
    password: 'password',
    password_confirmation: 'password'
  )
  (1..100).each do |j|
     Calorie.create(
      calories_number: rand(250..1000) + j,
      burned_or_consumed: [0, 1].sample,
      comment: "test-#{j}",
      created_at: Time.now - j.days,
      updated_at: Time.now - j.days,
      user_id: i
    )
  end
end


