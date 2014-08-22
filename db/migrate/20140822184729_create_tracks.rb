class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.integer :popularity
      t.integer :duration
      t.timestamps
    end
  end
end
