angular.module("ReadingList").service('bookService', function($http){
	return {
		GetBooks: function(){ return '/api/books' },
	}
})