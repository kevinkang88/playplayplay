class TracksController < ApplicationController
  before_filter :auth_user

  def search

  end

  def result
    search_term = params["Search"]
    spotify = Spotify.new
    @results = spotify.search_track(search_term)
  end

  def create
    track_info = params["track"]
    @track = Track.create(
      title: track_info["title"],
      date: track_info["date"],
      artist: track_info["artist"],
      album: track_info["album"],
      length: track_info["length"],
      pop: track_info["pop"],
      full: track_info["full"],
    )
    redirect_to(playlists_path(track_id:@track))
  end

end


