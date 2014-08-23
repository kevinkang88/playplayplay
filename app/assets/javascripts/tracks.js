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
  var spotify = this;
  this.spotifyApi.searchTracks(inputVal)
    .then(function(data) {
      var returnedDataAry = data.tracks.items;
      console.log(returnedDataAry);
      var queryAry = [];
      for(var i = 0; i < returnedDataAry.length ; i++){
        var track = {};
        track['artistName'] = returnedDataAry[i].artists[0].name
        track['album'] = returnedDataAry[i].album.name
        track['trackName'] = returnedDataAry[i].name
        track['spotifyFullUrl'] = returnedDataAry[i].external_urls.spotify
        track['previewUrl'] = returnedDataAry[i].preview_url
        track['pop'] = returnedDataAry[i].popularity
        track['img'] = returnedDataAry[0].album.images[0].url
        queryAry.push(track);
      };
      console.log(queryAry);
      $.ajax({
        url: "/tracks/search",
        type: "GET",
        dataType: "json",
        data:{returnedData:queryAry}
      }).done(function(data){
        console.log(data);
        console.log('done :D');
      }).fail(function(){
        console.log('failed :[');
      });
    }, function(err) {
      console.error(err);
    });
};
// activate search btn
Spotify.prototype.searchTracks = function(){
  var spotify = this;
  $('#search-btn').on('click',function(){
    var inputVal = spotify.extractInput()
    spotify.searchSpotify(inputVal);
  });
};


// controller + initializer
var setUpSearch = function(){
  var spotify = new Spotify();
  var returnedData = spotify.searchTracks();
};

