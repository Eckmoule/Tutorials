angular.module("ReadingList").controller('BooksIndexController', function($scope, $http){
	$http.get('/api/books').then(function($response){
		$scope.books = $response.data.books
	});
})