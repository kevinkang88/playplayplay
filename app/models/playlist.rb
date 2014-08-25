class Playlist < ActiveRecord::Base
  attr_accessible :title, :body, :title, :user_id
  has_many :tracks
end
