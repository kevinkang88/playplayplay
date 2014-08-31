class PlaylistsController < ApplicationController

  def index
    @track_id = params["track_id"]
    @all_playlists = Playlist.all
    @user_playlists = User.find(current_user.id).playlists
    respond_to do |format|
      format.html
      format.js
    end
  end

  # adds track to the playlist
  def add
    track_id = params["playlist"]["track_id"]
    playlist_id = params["playlist"]["playlist_id"]
    track = Track.find_by_id(track_id)
    track.playlist_id = playlist_id
    last_place = Playlist.find(playlist_id).tracks.order('place ASC').last
    if last_place == nil
      track.place = 1
    else
      track.place = last_place.place + 1
    end
    track.save
    # code below recalculates coolness everytime track is added
    redirect_to(playlist_path(playlist_id))
  end

  def show
    playlist_id = params["id"]
    @playlist = Playlist.find(playlist_id)
    @playlist.coolness = (@playlist.coolness_calculator * 100 ).to_i
    @playlist.save
    @ordered_tracks = Playlist.find(playlist_id).tracks.order('place ASC')
  end

  def edit
    playlist_id = params['id']
    @playlist = Playlist.find(playlist_id)
    @ordered_tracks = Playlist.find(playlist_id).tracks.order('place ASC')
  end

  def update
    playlist_id = params['playlist']['id']
    updated_title = params['playlist']['title']
    updated_order = params["playlist"].select{|k,v| k.match(/place/)}.values
    # update playlist title
    playlist = Playlist.find(playlist_id)
    playlist.title = updated_title
    playlist.save
    # update track order
    current_ordered_list = Playlist.find(playlist_id).tracks.order('place ASC')
    i = 0
    current_ordered_list.each do |track|
      track.place = updated_order[i]
      track.save
      i += 1
    end
    redirect_to(playlist_path(playlist_id))
  end

end