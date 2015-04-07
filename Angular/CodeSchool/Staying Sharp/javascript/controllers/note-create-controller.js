angular.module('NoteWrangler')
.controller('NotesCreateController', function($http){
	var controller = this;
	this.saveNote = function(note){
		controller.errors = null;
		$http({method: 'POST', url: './data/', datas: note})
		.catch(function(note){
			console.log(note.data.error); //The error is undefined but there is no backend, need to be check with backend
			controller.errors = note.data.error;
		})
	}
});