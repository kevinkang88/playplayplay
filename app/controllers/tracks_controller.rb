class TracksController < ApplicationController
  before_filter :authenticate_user!

  def search

  end

  def result
    search_term = params["Search"]
    spotify = Spotify.new
    @results = spotify.search_track(search_term)
  end

end
