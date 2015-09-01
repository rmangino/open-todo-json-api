# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

###############################################################################

# Remove all data

User.destroy_all

###############################################################################

# Create Users

user = User.create(email: "admin@example.com", password: "password")

###############################################################################

# Create Lists

[
  { title: "List Title 1", user: user },
  { title: "List Title 2", user: user },
  { title: "List Title 3", user: user },
  { title: "List Title 4", user: user }
].each do |list_attributes|

  list = List.create(list_attributes)

    4.times do |i|
      list.items.create(title: "List item #{i+1}", complete: [true, false].sample)
    end

end

###############################################################################

# Report results

puts "Seed Finished"
puts "#{User.count} Users created"
puts "#{List.count} Lists created"
puts "#{Item.count} Items created"