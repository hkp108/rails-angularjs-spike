angular
  .module('Rec')
  .controller('MovieSearchCtrl', ['$scope','$resource','MovieSearchService', function($scope,$resource,_MovieSearchService_) {

    // Movie = $resource('/api/movies/:id', {userId:'@id'});
    var MovieSearchService = _MovieSearchService_;
    $scope = $scope;
    var self = this;
    $scope.movies = Movie.query();
    $scope.movieSearchResults = [];

  self.searchForMovie = function(title) {
    MovieSearchService.searchFor(title)
    .then(_storeMovieResults);
  };

  function _storeMovieResults(result) {
    $scope.movieSearchResults = result;
    $scope.movieTitle = null;
}

    self.addMovie = function(selectedMovie) {

    var entry = Movie.save({title: selectedMovie.title});
      console.log($scope.movies);
    $scope.movies.push(entry);
    $scope.movieSearchResults = null;
  };
  $scope.haha = "me";
  }]);
