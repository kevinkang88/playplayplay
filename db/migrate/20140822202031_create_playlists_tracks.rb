class CreatePlaylistsTracks < ActiveRecord::Migration
  def change
    create_table :playlists_tracks do |t|

      t.timestamps
    end
  end
end
