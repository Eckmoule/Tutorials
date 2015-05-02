//Apparently $resource is good for simple stuff, $http can be use for more personalized stuff 
angular.module("StayingSharp").factory('Category', function($resource){
	return $resource('/categories/:id');
});