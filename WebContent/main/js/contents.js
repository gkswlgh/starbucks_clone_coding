/**
 * main page contents : 본문 영역
 */

$(document).ready(function() {
	$('.prom_slider_list').slick({
		centerMode: true,
		centerPadding: '60px',
		slidesToShow: 3,
		autoplay: true,
		autoplaySpeed: 2000,
		responsive: [
			{
				breakpoint: 768,
				settings: {
					arrows: false,
					centerMode: true,
					centerPadding: '40px',
					slidesToShow: 3
				}
			},
			{
				breakpoint: 480,
				settings: {
					arrows: false,
					centerMode: true,
					centerPadding: '40px',
					slidesToShow: 1
				}
			}
		]
	});
});