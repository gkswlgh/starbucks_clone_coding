/**
 * footer : award_slide
 */

$(document).ready(function() {
	$('.awards_slider').slick({
		slidesToShow: 3,
		slidesToScroll: 3,
		autoplay: true,
		autoplaySpeed: 2000,
		arrows:false
	});
	$(".slider_stop").on('click', function() {
		$(".slider_start").attr('style', 'opacity:1;cursor:Pointer;');
		$(".slider_stop").attr('style', 'opacity:0.4;cursor:Default;');
		$(".awards_slider").slick('slickPause');
	});
	$(".slider_start").on('click', function() {
		$(".slider_stop").attr('style', 'opacity:1;cursor:Pointer;');
		$(".slider_start").attr('style', 'opacity:0.4;cursor:Default;');
		$(".awards_slider").slick('slickPlay');
	});
});
