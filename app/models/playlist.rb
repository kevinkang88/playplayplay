class Playlist < ActiveRecord::Base
  attr_accessible :title, :body, :title, :user_id
  has_many :playlists_tracks
  has_many :tracks, through: :playlists_tracks
end
