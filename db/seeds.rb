# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts "--------------------------------------"
puts "--------Creating Users----------------"
User.create(email:"kevinkang88@gmail.com",password:"password")
puts "-------------------Done---------------"

puts "--------------------------------------"
puts "--------Creating Playlists------------"
Playlist.create(user_id:1,title:"chill out time")
Playlist.create(user_id:1,title:"study music mix")
puts "-------------------Done---------------"
