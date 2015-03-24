$(document).ready(function(){
	
	$("#css").on("click", "li", function(){ 
		$(this).css({"background-color": "#000000", "border-color": "#666666"}); 
	});

	$("#class").on("click", "li", function(){ $(this).toggleClass("color"); });

	$("#animate").on("click", "li", function(){ 
		$(this).toggleClass("color");
		if($(this).hasClass("color")) { $(this).animate({"margin-top" : "-10px"}); }
		else { $(this).animate({"margin-top" : "0px"});} 
	});

	$("#speed").on("click", "li", function(){ 
		//600 = slow keyword, 200 = fast keyword
		$(this).toggleClass("color");
		if($(this).hasClass("color")) { $(this).animate({"margin-top" : "-10px"}, 600); }
		else { $(this).animate({"margin-top" : "0px"}, 'slow');} 
	});

	$("#css-animation").on("click", "li", function(){ $(this).toggleClass("animated-color"); });
});