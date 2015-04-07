angular.module('NoteWrangler')
.controller('NotesShowController', function($http, $routeParams){
	var controller = this;
	$http({method: 'GET', url: './data/products.json'}).success(function(data){
		controller.note = data.filter(function(x){ return x.id == $routeParams.id })[0];
	});
});