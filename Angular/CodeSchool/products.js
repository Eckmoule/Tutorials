(function() {

	var app = angular.module('product-directives', []);

	app.directive('reviewPreview', function(){
      return {
        restrict: 'E',
        templateUrl: 'directives/reviewPreview.html'
      };
    });

    app.directive('productDescription', function(){
      return {
        restrict: 'E',
        templateUrl: 'directives/productDescription.html'
      };
    });

    app.directive("productSpecs", function() {
      return {
        restrict: 'A',
        templateUrl: 'directives/productSpecs.html'
      };
    });

    app.directive("productGallery", function() {
      return {
        restrict: 'E',
        templateUrl: 'directives/product-gallery.html',
        controller: function(){
          this.current = 0;
          this.setCurrent = function(imageNumber){
            this.current = imageNumber || 0;
          };
         },
        controllerAs: 'gallery',
      };
    });

    app.directive("productTabs", function(){
      return {
        restrict: "E",
        templateUrl: "directives/product-tabs.html",
        controller: function(){
          this.tab = 1;

          this.setTab = function(newValue){
              this.tab = newValue;
          };

          this.isSet = function(tabName){
              return this.tab === tabName;
          };
        },
        controllerAs: 'tab',
      };
    });

})();