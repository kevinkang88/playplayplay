class TracksController < ApplicationController
  before_filter :authenticate_user!

  def search
    spot = Spotify.new
    spot.search_track("lonely girl")
  end

  def result

  end

end
