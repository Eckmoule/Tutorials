$(document).ready(function(){
	
	////Descendant selectors
	$("#descendant").find("li").text("selected");

	//Pseudo selectors
	$("#position").find("li").first().text("selected");
	$("#position").find("li").last().text("selected");

	//Walking
	$("#walk").find("li").first().next().text("selected");

	//Children / Parent
	$("#parent").children("li").text("selected");

});