# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Drop db on re-seed
require 'csv'
require "open-uri"
require "yaml"

EmployeeProfile.destroy_all
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
user = User.new(email: "test@test.com", password: "abc123")
user.save!
# 80.times do
#   p "creating industry"
#   industry = Industry.new(
#   name: Faker::Company.industry
#   )
#   industry.save!
# end
# 80.times do
#   p "creating company"
#   company = Company.new(
#     name: Faker::Company.name,
#     description: "#{Faker::Lorem.paragraph} #{Faker::Lorem.paragraph} #{Faker::Lorem.paragraph} #{Faker::Lorem.paragraph}",
#     industry: Industry.all.sample
#   )
#   company.save!
# end


industries_file = YAML.load_file('db/industries.yml')

puts "Creating Industries..."

industries_file["industries"].each do |name|
  Industry.create! name
end

puts "Industries created"

puts "Creating companies"

csv_options = { col_sep: ',', quote_char: '"', headers: :first_row }


for num in (1..26) do
  filepath    = "db/csvs/companies#{num}.csv"
  CSV.foreach(filepath, csv_options) do |row|
    name = row['name']
    description = row['description']
    logo_url = row['logo-src']
    industry = Industry.find_by(name: "Não disponível")
    new_company = Company.new(name: name, description: description, logo_url: logo_url, industry: industry)
    new_company.save! unless Company.find_by(name: new_company.name)
  end
end
p "Companies created!"
Company.all.each do |company|
  5.times do
    review = Review.new
    review.content = "Seinfeld: #{Faker::Seinfeld.quote} SV: #{Faker::SiliconValley.quote} IT: #{Faker::TheITCrowd.quote}"
    review.user_area = Faker::Commerce.department
    review.user_position = %w(Manager Assistant Lawyer CEO CFO CTO).sample
    review.weighting = 100
    review.company = company
    review.user = User.first
    p "creating answer"
    answer = Answer.new
    answer.review = review
    answer.answer_1 = (1..5).to_a.sample
    answer.answer_2 = (1..5).to_a.sample
    answer.answer_3 = (1..5).to_a.sample
    answer.answer_4 = (1..5).to_a.sample
    answer.answer_5 = (1..5).to_a.sample
    answer.minority = false
    answer.save!
    review.save!
    p "calculating scores"
    review.company.answer_1_total_score += review.answer.answer_1 * 20
    review.company.answer_2_total_score += review.answer.answer_2 * 20
    review.company.answer_3_total_score += review.answer.answer_3 * 20
    review.company.answer_4_total_score += review.answer.answer_4 * 20
    review.company.answer_5_total_score += review.answer.answer_5 * 20
    review.company.save!
    p review.company.answer_5_total_score
  end
end

Company.all.each do |company|
  company.answer_1_average_score = company.answer_1_total_score / company.reviews.length
  company.answer_2_average_score = company.answer_2_total_score / company.reviews.length
  company.answer_3_average_score = company.answer_3_total_score / company.reviews.length
  company.answer_4_average_score = company.answer_4_total_score / company.reviews.length
  company.answer_5_average_score = company.answer_5_total_score / company.reviews.length
  company.final_rating = (company.answer_1_average_score + company.answer_2_average_score + company.answer_3_average_score + company.answer_4_average_score + company.answer_5_average_score) / 5
  p company.final_rating
  company.save!
end


