angular
  .module('Rec')
  .controller('MoveCtrl', ['$scope','$resource', function($scope,$resource) {

    Movie = $resource('/api/movies/:id', {userId:'@id'});
    $scope.message = "hello world";
    $scope.movies = Movie.query();

    $scope.addMovie = function() {
      var entry = Movie.save({title: $scope.newmovie});
      $scope.movies.push(entry);
      $scope.newmovie = null;
    };

    $scope.removeMovie = function(movie) {
      var movietodelete = Movie.delete({id: movie.id});
      console.log("Movie deleted");
      $scope.movies = Movie.query();
    };

  }]);
