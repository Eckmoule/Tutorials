angular.module('NoteWrangler')
.directive("nwCategoryItem", function(){
	return {
		replace: true,
		restrict: "E",
		templateUrl: "./templates/directives/nw-category-item.html",
		scope: {
			category: "="
		},
		require: "^nwCategorySelect",
		link: function(scope, element, attrs, nwCategorySelect){
			scope.makeActive = function(){
				nwCategorySelect.setActiveCategory(scope.category);
			}

			scope.categoryActive = function() {
				return scope.category.id == nwCategorySelect.getActiveCategory().id
			}
		},
	}
})