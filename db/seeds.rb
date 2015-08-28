# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

[
  { title: "List Title 1" },
  { title: "List Title 2" },
  { title: "List Title 3" },
  { title: "List Title 4" }
].each do |list_attributes|
  List.create(list_attributes)
end