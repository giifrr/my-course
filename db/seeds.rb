# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

5.times do
  Course.create(title: Faker::Educator.course_name, 
                description: Faker::Movie.quote, 
                user_id: 1,
                short_description: Faker::Movie.quote,
                price: Faker::Number.number(digits: 3),
                language: Faker::Nation.language,
                level: ["Beginner", "Intermediate", "Advanced"].sample)
end