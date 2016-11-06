require 'csv'

csv_text = File.read(Rails.root.join('lib', 'seeds', 'obce.csv'))
csv = CSV.parse(csv_text, encoding: 'utf-8')

puts 'seeding cities'
csv.each do |row|
  City.create name: row[1]
end

puts 'seeding users'
10.times do
  User.create email: Faker::Internet.email, name: Faker::Superhero.name, password: '123456', password_confirmation: '123456'
end

puts 'seeding categories'
Category.create name: 'Sport'
Category.create name: 'Music'
Category.create name: 'Food'
Category.create name: 'Culture'
Category.create name: 'Other'

city = City.find_by name: 'Bratislava - Karlova Ves'
users = User.all
categories = Category.all
puts 'seeding posts'
20.times do
  Post.create! name: Faker::StarWars.planet, description: Faker::Lorem.paragraphs(5),
              time: Faker::Time.forward(200).to_i, entry_fee: rand(40), limited: rand < 0.5, limit: rand(15),
              city: city, user: users[rand(users.size-1)+1], category: categories[rand(categories.size-1) +1],
              locality: 'Mlynská dolina 53'
end
