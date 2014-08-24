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
    PlaylistsTrack.create(playlist_id:track_id,track_id:playlist_id)
  end
end
