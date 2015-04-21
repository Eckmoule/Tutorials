angular.module('NoteWrangler')
.directive("nwCategorySelect", function(Category){
	return {
		replace: true,
		restrict: "E",
		templateUrl: "./templates/directives/nw-category-select.html",
		controller: ["$scope", function($scope){
			this.getActiveCategory = function(){
				return $scope.activeCategory;
			}

			this.setActiveCategory = function(category){
				$scope.activeCategory = category;
			}
		}],
		link: function(scope, element, attrs){
			Category.all().success(function(data){
				scope.categories = data;
			});
		},
		scope: {
			activeCategory: "=",
		},
	}
})