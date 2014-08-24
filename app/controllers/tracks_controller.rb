class TracksController < ApplicationController
  before_filter :authenticate_user!

  def search

  end

  def result
    search_term = params["Search"]
    spotify = Spotify.new
    @results = spotify.search_track(search_term)
  end

  def create
    require 'pry';binding.pry
  end

end


params["track"] =
=> {"title"=>"Sexy Bitch (feat. Akon)",
 "date"=>"2009",
 "artist"=>"David Guetta",
 "album"=>"Sexy Bitch",
 "length"=>"195.853",
 "pop"=>"0.74",
 "full"=>"https://play.spotify.com/track/28O4PwkH8bzARStxeL4pxL"}