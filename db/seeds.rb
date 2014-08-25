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

puts "--------------------------------------"
puts "--------Creating Tracks---------------"
Track.create(playlist_id: 1, pop: "0.5", length: "90", date: "2014", artist: "test1", title: "test title1", full: "test1url", album: "test album1", place: 1,)
Track.create(playlist_id: 1, pop: "0.5", length: "90", date: "2014", artist: "test2", title: "test title2", full: "test2url", album: "test album2", place: 2,)
Track.create(playlist_id: 1, pop: "0.5", length: "90", date: "2014", artist: "test3", title: "test title3", full: "test3url", album: "test album3", place: 3,)
puts "-------------------Done---------------"
