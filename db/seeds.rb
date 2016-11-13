require 'csv'

csv_text = File.read(Rails.root.join('lib', 'seeds', 'obce.csv'))
csv = CSV.parse(csv_text, encoding: 'utf-8')

puts 'seeding cities'
csv.each do |row|
  City.create name: row[1]
end

puts 'seeding categories'
Category.create name: 'Hudba'
Category.create name: 'Šport'
Category.create name: 'Jedlo'
Category.create name: 'Kultúra'
Category.create name: 'Iné'

