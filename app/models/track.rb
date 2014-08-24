class Track < ActiveRecord::Base
  attr_accessible :title, :date,:artist,:album,:length,:pop,:full
  has_many :playlists_tracks
  has_many :playlists, through: :playlists_tracks
end
