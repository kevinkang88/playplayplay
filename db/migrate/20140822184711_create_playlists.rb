class CreatePlaylists < ActiveRecord::Migration
  def change
    create_table :playlists do |t|
      t.belongs_to :user
      t.string :title
      t.decimal :coolness
      t.timestamps
    end
  end
end
