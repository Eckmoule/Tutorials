angular.module('ReadingList').config(function($routeProvider){
	$routeProvider
		.when('/', {
			redirectTo: '/books'
		})
		.when('/books', {
			templateUrl: "templates/books/index.html",
			controller: "BooksIndexController"
		})
		.when('/books/new', {
			templateUrl: "templates/books/new.html",
			controller: "BooksCreateController"
		})
		.when('/books/:id', {
			templateUrl: "templates/books/show.html",
			controller: "BooksShowController"
		})
		.when('/books/:id/edit', {
			templateUrl: "templates/books/edit.html",
			controller: "BooksEditController"
		})
});