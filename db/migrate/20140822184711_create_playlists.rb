class CreatePlaylists < ActiveRecord::Migration
  def change
    create_table :playlists do |t|
      t.belongs_to :user
      t.string :title
      t.timestamps
    end
  end
end
