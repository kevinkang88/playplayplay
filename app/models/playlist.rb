class Playlist < ActiveRecord::Base
  attr_accessible :title, :body, :title, :user_id, :coolness, :description
  has_many :tracks

  def coolness_calculator
    duration_times_pops = []
    durations = []
    self.tracks.each do |track|
      durations << track.length.to_f
      duration_times_pops << (track.length.to_f * track.pop.to_f)
    end
    total_duration = durations.reduce(:+)
    total_coolness = duration_times_pops.reduce(:+)
    coolness = total_coolness / total_duration
    coolness
  end
end