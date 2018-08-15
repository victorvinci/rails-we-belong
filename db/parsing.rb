require 'csv'

csv_options = { col_sep: ',', quote_char: '"', headers: :first_row }
filepath    = 'companies.csv'

CSV.foreach(filepath, csv_options) do |row|
  puts "#{row['name']}, a #{row['description']} beer from #{row['']}"
end

# storing

# csv_options = { col_sep: ',', force_quotes: true, quote_char: '"' }
# filepath    = 'beers.csv'

# CSV.open(filepath, 'wb', csv_options) do |csv|
#   csv << ['Name', 'Appearance', 'Origin']
#   csv << ['Asahi', 'Pale Lager', 'Japan']
#   csv << ['Guinness', 'Stout', 'Ireland']
#   # ...
# end
