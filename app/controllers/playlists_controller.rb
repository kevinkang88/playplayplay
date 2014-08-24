class PlaylistsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @track_id = params["track_id"]
    @all_playlists = Playlist.all
    @user_playlists = User.find(current_user.id).playlists
    # "track_id"=>"7", "action"=>"index", "controller"=>"playlists"}
  end
  # adds track to the playlist
  def add
    track_id = params["playlist"]["track_id"]
    playlist_id = params["playlist"]["playlist_id"]
    track = Track.find_by_id(track_id)
    track.playlist_id = playlist_id
    last_place = Playlist.find(playlist_id).tracks.order('place ASC').last.place
    if last_place == nil
      track.place = 1
    else
      track.place = last_place + 1
    end
    track.save
    redirect_to(playlist_path(playlist_id))
  end

  def show
    playlist_id = params["id"]

  end
end
