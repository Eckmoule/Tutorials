angular.module("NoteWrangler")
.factory("Category", function CategoryFactory($http) {
	return {
		all: function() {
			return $http({method: 'GET', url: './data/products.json'});
		},
		create: function(note) {
			return $http({method: 'POST', url: './data/', datas: note})
		},
	}
});