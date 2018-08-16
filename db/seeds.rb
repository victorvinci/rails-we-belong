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



