class TracksController < ApplicationController

  def search
    respond_to do |format|
      format.js
      format.html
    end
  end

  def result
    search_term = params["Search"]
    spotify = Spotify.new
    @results = spotify.search_track(search_term)
  end

  def create
    @track = Track.create(
      title: params["title"],
      date: params["date"],
      artist: params["artist"],
      album: params["album"],
      length: params["length"],
      pop: params["pop"],
      full: params["full"],
    )
    redirect_to(playlists_path(track_id:@track))
  end

end


