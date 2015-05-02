//Apparently $resource is good for simple stuff, $http can be use for more personalized stuff 
angular.module("StayingSharp").factory('User', function($resource){
	return $resource('/users/:id');
});