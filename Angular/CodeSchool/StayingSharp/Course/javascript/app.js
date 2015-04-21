angular.module("NoteWrangler", ["ngResource", "ngRoute"])
.config(function(NoteProvider){
	NoteProvider.setSize(100);
});