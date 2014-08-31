class CreatePlaylists < ActiveRecord::Migration
  def change
    create_table :playlists do |t|
      t.belongs_to :user
      t.string :title
      t.text :description
      t.integer :coolness
      t.timestamps
    end
  end
end
