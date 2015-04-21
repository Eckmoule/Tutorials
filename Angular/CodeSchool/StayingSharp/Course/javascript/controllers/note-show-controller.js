angular.module('NoteWrangler')
.controller('NotesShowController', function($routeParams, Note){
	var controller = this;
	Note.all().success(function(data){
		controller.note = data.filter(function(x){ return x.id == $routeParams.id })[0];
	});
});