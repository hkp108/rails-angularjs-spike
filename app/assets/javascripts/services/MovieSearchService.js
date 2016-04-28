angular
  .module('Rec')
  .service('MovieSearchService', ['$http', function($http) {
  var self = this;

  self.searchFor = function(title) {
    return $http.get('https://api.themoviedb.org/3/search/movie?query=' + title + '&api_key=40b339f0fde8924dd93e33c92bb397ef')
    .then(_handleResponseFromApi);
  };

  function _handleResponseFromApi(response) {
    console.log(response.data.results);
    return response.data.results.map(function(searchResults) {
      return {title: searchResults.title, id: searchResults.id};
    });
  }
}]);
