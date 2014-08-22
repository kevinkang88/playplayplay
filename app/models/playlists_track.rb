class PlaylistsTrack < ActiveRecord::Base
  attr_accessible :title, :body, :track_id, :playlist_id
  belongs_to :playlist
  belongs_to :track
end
