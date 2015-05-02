angular.module("StayingSharp").directive("stCategorySelector", function(Category){
	return {
		replace: true,
		restrict: "E",
		require: "?ngModel", //? is for optional
		templateUrl: 'views/templates/directives/stCategorySelector.html',
		link: function(scope, element, attrs, ngModelCtrl){
			var activeCategory;
			scope.categories = Category.query();

			scope.IsActive = function(category){
				return activeCategory && category.id === activeCategory.id;
			}

			scope.toggleCtegory = function(category){
				if(activeCategory && category.id === activeCategory.id){
					activeCategory = {}; //This is not working because the default behavior of btn-group bootstrap is already handling this stuff
				}else{
					activeCategory = category;
				}
				ngModelCtrl.$setViewValue(activeCategory);
			}

			ngModelCtrl.$render = function() {
				activeCategory = ngModelCtrl.$viewValue;
			}
		}
	};
});