angular.module("StayingSharp").filter("categoryFilter", function(){
	return function(collection, category){
		var newCollection = [];
		if(category && category.id){
			for(var i = 0; i < collection.length; i++){
				if(collection[i].categoryId === category.id){
					newCollection.push(collection[i]);
				}
			}
			return newCollection;
		}else{
			return collection;
		}
		
	}
});