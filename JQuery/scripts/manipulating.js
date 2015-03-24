$(document).ready(function(){

	var add = $("<li> Added </li>");

	//Before method
	$(".startpoint").before(add);

	//After method
	add = $("<li> Added </li>"); 
	$(".startpoint2").after(add);

	//Prepend method
	add = $("<li> Added </li>");
	$("#prepend").prepend(add);

	//Append method
	add = $("<li> Added </li>");
	$("#append").append(add);

	//Remove method
	$("#remove").children().first().remove();

	//Closest method
	$("#closestStartPoint").closest(".closest").remove();

	//Add/Remove classes
	$(".class").children().first().addClass("added"); 
	$(".removed").removeClass("removed");

});