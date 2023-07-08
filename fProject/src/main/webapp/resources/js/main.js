$(function() {
	$('.nav>li').mouseover(function() {
		$(this).children('.submenu').stop().slideDown(200);
	});
	$('.nav>li').mouseout(function(){
		$(this).children('.submenu').stop().slideUp(200);
	});
});