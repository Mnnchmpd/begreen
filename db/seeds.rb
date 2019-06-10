# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# puts 'Creating...'
# Journey.create(starting_point: '16 Villa Gaudelet, Paris', ending_point: 'Antony', footprint: '3000g', duration: '30min', date: '05/06/2019', user_id: 1)

# puts 'Finished!'

puts "Destroying all journeys..."
Journey.destroy_all

require 'csv'
csv_options = { col_sep: ';', headers: :first_row }
filepath    = 'db/adress_begreen.csv'

puts "Creating journeys from CSV file..."

CSV.foreach(filepath, csv_options) do |row|
  Journey.create!(
    starting_point: row[0],
    ending_point: row[1],
    footprint: rand(0..400),
    date: row[2],
    user_id: 1,
    )
end

puts "All done!"

