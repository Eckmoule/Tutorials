angular.module('StayingSharp').controller('UserShowController', function(User, $scope, $routeParams){
	$scope.user = User.get({id: $routeParams.id });
});