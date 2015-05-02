angular.module('StayingSharp').controller('UserIndexController', function(User, $scope){
	$scope.users = User.query();

});