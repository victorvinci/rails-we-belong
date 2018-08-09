# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Drop db on re-seed
p "Destroying votes"
Vote.destroy_all
p "Dropping answers"
Answer.destroy_all
p "Dropping reviews"
Review.destroy_all
p "Reviews dropped"
p "Dropping old companies table"
Company.destroy_all
p "Companies dropped"
p "Deleting industries"
Industry.destroy_all
"Industries destroyed"
p "Deleting users"
User.destroy_all
p "Users dropped"
p "Reticulating splines"

5.times do
  p "creating industry"
  industry = Industry.new(
  name: Faker::Company.industry
  )
  industry.save!
end
5.times do
  p "creating company"
  company = Company.new(
    name: Faker::Company.name,
    description: "#{Faker::Lorem.paragraph} #{Faker::Lorem.paragraph} #{Faker::Lorem.paragraph} #{Faker::Lorem.paragraph}",
    industry: Industry.all.sample
  )
  company.save!
end

