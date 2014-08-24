class Spotify < ActiveResource::Base
  # attr_accessible :title, :body
  attr_reader :end_pt

  def initialize
    @end_pt = "http://ws.spotify.com/search/1/track.json?q="
  end

  def search_track(param)
    temp = param.split
    if temp.length == 1
      key = param
    else
      key = temp.join("+")
    end
    detailed_tracks_raw = RestClient.get("http://ws.spotify.com/search/1/track.json?q=#{key}")
    tracks_ary = JSON.parse(detailed_tracks_raw)['tracks']
    tracks_ary_parsed = extract_info(tracks_ary)
    return tracks_ary_parsed
  end

  protected

  def extract_info(tracks_ary)
    tracks_infos = []
    tracks_ary.each do |track|
      track_data = {}
      track_data['title'] = track['name']
      track_data['album'] = track['album']['name']
      track_data['date'] = track['album']['released']
      track_data['pop'] = track['popularity']
      track_data['length'] = track['length']
      track_data['full'] = "https://play.spotify.com/track/#{track['href'][14..-1]}"
      track_data['artist'] = track['artists'][0]['name']
      tracks_infos.push(track_data)
    end
    tracks_infos
  end
end
