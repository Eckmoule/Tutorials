angular.module('StayingSharp').controller('NoteIndexController', function(Note, $scope){
	$scope.notes = Note.query();
	$scope.search = {};
	window.sc = $scope;
});