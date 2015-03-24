$(document).ready(function(){

	//Descendant selectors
	$("#descendant li").text("selected");

	//Child selectors
	$("#child > li").text("selected");

	//Multi selectors
	$("#multi-level2-item1, .multi-item2").text("selected");

	//Position selectors
	$("#postition li:first, #position li:last").text("selected");

	//Odd, Even selectors
	$("#position2 li:odd").text("odd");
	$("#position2 li:even").text("even");

});