// this is Spotify class
var Spotify = function(){
  this.spotifyApi = new SpotifyWebApi;
};
// get the input value from the box
Spotify.prototype.extractInput = function(){
  var inputVal = $('#search-box').val() ;
  return inputVal ;
};
// hit the api get end point
Spotify.prototype.searchSpotify = function(inputVal){
  this.spotifyApi.searchTracks(inputVal)
    .then(function(data) {
      console.log("Search by " + inputVal, data);
      return data
    }, function(err) {
      console.error(err);
    });
};
// activate search btn
Spotify.prototype.searchTracks = function(){
  var spotify = this;
  $('#search-btn').on('click',function(){
    var inputVal = spotify.extractInput() ;
    var returnedData = spotify.searchSpotify(inputVal);
    return returnedData ;
  });
};
// controller + initializer
var setUpSearch = function(){
  var spotify = new Spotify();
  spotify.searchTracks();
};