var app = angular.module('sounds');

app.service('soundService', function($http) {

  this.getArtist = function(artist) {
    return $http({
      method: 'GET',
      url: 'http://api.soundcloud.com/users/' + artist + '/tracks.json?client_id=bda4ada8694db06efcac9cf97b872b3e'
    })
  };

})