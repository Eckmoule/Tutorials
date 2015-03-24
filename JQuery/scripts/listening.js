$(document).ready(function(){
	function showIt(){
		$(this).closest(".Test").find(".moreInfos").slideToggle();
	}

	$(".Test").on("click", "button", showIt).on("mouseenter", "h2", showIt).on("mouseleave", "h2", showIt);

	$(".key").on("keyup", ".quantity", function(){
		var price = +$(this).closest(".key").find(".price").data("price");
		var quantity = +$(this).val();
		$(this).closest(".key").find(".result").text(price * quantity);
	});

	$(".event").on("click", "a", function(event){
		event.preventDefault();
		$("#show").fadeToggle();
	});
});