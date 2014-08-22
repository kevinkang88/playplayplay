class Track < ActiveRecord::Base
  attr_accessible :title, :body, :popularity, :duration
  has_many :playlists_tracks
  has_many :playlists, through: :playlists_tracks
end
