/*
angular.module("NoteWrangler")
.factory("Note", function NoteFactory($http) {
	var size = 80; //Let's assume that we need to request a size.
	return {
		all: function() {
			return $http({method: 'GET', url: './data/products.json'});
		},
		create: function(note) {
			return $http({method: 'POST', url: './data/', datas: note})
		},
	}
});
*/
/* The factory can be refactor into a provider (factory with configuration) */

angular.module("NoteWrangler")
.provider("Note", function NoteProvider() {
	var currentSize = 80; //Let's assume that we need to request a size.

	this.setSize = function(size){ //There is a config section on app.js to set the size
		currentSize = size;
	}

	this.$get = function($http) {
		return {
			all: function() {
				return $http({method: 'GET', url: './data/products.json'});
			},
			create: function(note) {
				return $http({method: 'POST', url: './data/', datas: note})
			},
		}
	}
});