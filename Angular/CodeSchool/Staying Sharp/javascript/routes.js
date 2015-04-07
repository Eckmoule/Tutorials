angular.module("NoteWrangler").config(function($routeProvider){
	$routeProvider.when('/notes', {
		templateUrl: './templates/pages/notes/index.html',
		controller: 'NotesIndexController',
		controllerAs: 'indexController'
	})
	.when('/users', {
		templateUrl: './templates/pages/users/index.html'
	})
	.when('/', {
		templateUrl: './templates/pages/notes/index.html'
	})
	.when('/notes/:id', {
		templateUrl: './templates/pages/notes/details.html',
		controller: 'NotesShowController',
		controllerAs: 'showController'
	})
	.when('/create', { //Find out why /notes/new doesn't seems to work 
		templateUrl: './templates/pages/notes/new.html',
		controller: 'NotesCreateController',
		controllerAs: 'createController'
	})
	.otherwise({
		redirectTo: '/'
	})
});