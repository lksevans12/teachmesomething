# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create!(email: 'lksevans12@gmail.com', username: 'lksevans12', password: '123456', website: 'www.lauraksevans.com', about: 'Developer')
Category.create!(category_name:"Arts and Culture")
Category.create!(category_name:"Animals")
Category.create!(category_name:"Buisness")
Category.create!(category_name:"Beauty and Health")
Category.create!(category_name:"Cooking")
Category.create!(category_name:"Design")
Category.create!(category_name:"Health and Fitness")
Category.create!(category_name:"Music")
Category.create!(category_name:"Medical")
Category.create!(category_name:"Religion")
Category.create!(category_name:"Politics")
Category.create!(category_name:"Technology")
Category.create!(category_name:"Writing")
Category.create!(category_name:"Other")
