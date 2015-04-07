angular.module('NoteWrangler')
	.controller('NotesIndexController', function($http){
		var controller = this;
		$http({method: 'GET', url: './data/products.json'}).success(function(data){
			controller.notes = data;
		});
	});