/**
 * footer : award_slide
 */

$(document).ready(function() {
	$('.awards_slider').slick({
		slidesToShow: 3,
		slidesToScroll: 3,
		autoplay: true,
		autoplaySpeed: 2000,
	});
	$(".slider_stop").on('click', function() {
		$(".awards_slider").slick('slickPause');
	});
	$(".slider_start").on('click', function() {
		$(".awards_slider").slick('slickPlay');
	});
});
