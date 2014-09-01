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

  def new

  end

  def create
    Playlist.create(user_id: current_user.id,
                    title: params["title"],
                    description: params["desc"])
    redirect_to(dashboard_index_path)
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
    if params["commit"] == "Edit Playlist"
      current_ordered_list = Playlist.find(params["id"]).tracks.order('place ASC')
      updated_order = params.select{|k,v|k.match(/og_ord/)}.values.map(&:to_i)
      current_ordered_list.each_with_index do |track,i|
        if !updated_order.include?(track.place)
          Track.find(track.id).destroy
        end
      end
      i = 1
      updated_order.each do |og_place|
        track = current_ordered_list[og_place - 1]
        track.place = i
        track.save
        i += 1
    end
    redirect_to(dashboard_index_path)

    else

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
  end

  def destroy
    if params["commit"] == "Edit Playlist"
      current_ordered_list = Playlist.find(params["id"]).tracks.order('place ASC')
      updated_order = params.select{|k,v|k.match(/og_ord/)}.values.map(&:to_i)
      current_ordered_list.each_with_index do |track,i|
        if !updated_order.include?(track.place)
          Track.find(track.id).destroy
        end
      end
      i = 1
      updated_order.each do |og_place|
        track = current_ordered_list[og_place - 1]
        track.place = i
        track.save
        i += 1
      end
      redirect_to(dashboard_index_path)
    else
      playlist_id = params["id"].to_s
      Playlist.find(playlist_id).destroy
      redirect_to(dashboard_index_path)
    end
  end


end