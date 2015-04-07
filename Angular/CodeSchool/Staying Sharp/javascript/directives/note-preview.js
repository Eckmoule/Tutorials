angular.module('NoteWrangler')
.directive("notePreview", function(){
	var num = 1;
	return {
		restrict: "E",
		scope: {
			description: "@",
		},
		templateUrl: "./templates/directives/note-preview.html",
		controller: function($scope){
			$scope.header = "Title Test" + num++;
		},
		link: function(scope, element, attrs){
			element.on("click", function(){
				console.log(attrs.description);
				element(".description").toggleClass("hidden"); //Is there something to do with Jquery ? 
			});
		},
	}
})