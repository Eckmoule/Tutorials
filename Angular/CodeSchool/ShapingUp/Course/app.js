(function() {

	var app = angular.module('gemStore',['product-directives']);

  //Controllers

	app.controller("StoreController", ['$http', function($http){
	   var store = this;
     store.products = [];

     $http.get("./datas/products.json").success(function(data){
        store.products = data;
     })
	}]);

  app.controller('ReviewController', function(){
    this.review = {};
    this.addReview = function(currentProduct){
      this.review.createdOn = Date.now();
      currentProduct.reviews.push(this.review);
      this.review = {};
    };
  });

 })();