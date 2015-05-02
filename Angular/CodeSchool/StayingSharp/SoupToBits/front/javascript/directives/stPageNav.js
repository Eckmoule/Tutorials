angular.module("StayingSharp").directive("stPageNav", function(){
	return {
		replace: true,
		restrict: "E",
		templateUrl: "views/templates/directives/stPageNav.html",
		controller: function($scope, $location){
			$scope.isPage = function(name){
				return new RegExp("/" + name + "($|/)").test($location.path());
			}
		}
	}
});