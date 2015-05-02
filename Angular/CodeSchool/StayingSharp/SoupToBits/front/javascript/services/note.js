//Apparently $resource is good for simple stuff, $http can be use for more personalized stuff 
angular.module("StayingSharp").factory('Note', function($resource){
	return $resource('/notes/:id', {id:"@id"}, {
		update: {
			method: "PUT"
		}
	});
});