class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.string :pop
      t.string :length
      t.string :date
      t.string :artist
      t.string :title
      t.string :full
      t.string :album
      t.timestamps
    end
  end
end
