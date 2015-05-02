angular.module("StayingSharp").config(function($routeProvider){
	$routeProvider
	.when('/', {
		redirectTo: '/notes',
	})
	.when('/notes', {
		templateUrl: "/views/templates/pages/notes/index.html",
		controller: "NoteIndexController"
	})
	.when('/notes/new', {
		templateUrl: "/views/templates/pages/notes/new.html",
		controller: "NoteCreateController"
	})
	.when('/notes/:id', {
		templateUrl: "/views/templates/pages/notes/show.html",
		controller: "NoteShowController"
	})
	.when('/notes/:id/edit', {
		templateUrl: "/views/templates/pages/notes/edit.html",
		controller: "NoteEditController"
	})
	.when('/users', {
		templateUrl: "/views/templates/pages/users/index.html",
		controller: "UserIndexController"
	})
	.when('/users/:id', {
		templateUrl: "/views/templates/pages/users/show.html",
		controller: "UserShowController"
	})
});