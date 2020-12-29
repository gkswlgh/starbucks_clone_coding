/**
 * main page contents : 본문 영역
 */

$(document).ready(function() {
	$(function() {
		$(".slogan_btn a").hover(
			function() {
				$(".slogan_btn a").css({
					color: '#fff',
					background: 'rgb(0,112,66)'
				});
			},
			function() {
				$(".slogan_btn a").css({
					color: '#fff',
					background: 'transparent'
				});
			}
		);
		$(".bean_detail_btn a, .store_btn a").hover(
			function() {
				$(".bean_detail_btn a, .store_btn a").css({
					color: '#fff',
					background: '#000'
				});
			},
			function() {
				$(".bean_detail_btn a, .store_btn a").css({
					color: '#555',
					background: 'transparent'
				});
			}
		);
		$(".slick-prev").hover(
			function() {
				$(".slick-prev").css({
					background: 'url(img/contents/arrow_left_on.png) center no-repeat, #fff'
				});
			},
			function() {
				$(".slick-prev").css({
					background: 'url(img/contents/arrow_left_on.png) center no-repeat'
				});
			}
		);

		$(".slick-next").hover(
			function() {
				$(".slick-next").css({
					background: 'url(img/contents/arrow_right_on.png) center no-repeat, #fff'
				});
			},
			function() {
				$(".slick-next").css({
					background: 'url(img/contents/arrow_right_on.png) center no-repeat'
				});
			}
		);

		$(".prom_inner_btn a").hover(
			function() {
				$(".prom_inner_btn a").css({
					color: '#fff',
					background: '#000'
				});
			},
			function() {
				$(".prom_inner_btn a").css({
					color: '#222',
					background: 'transparent'
				});
			}
		);
		$(".reserve_detail_btn a").hover(
			function() {
				$(".reserve_detail_btn a").css({
					color: '#fff',
					background: 'rgb(183, 130, 101)'
				});
			},
			function() {
				$(".reserve_detail_btn a").css({
					color: 'rgb(183, 130, 101)',
					background: 'transparent'
				});
			}
		);

		$(".menu_wrap_btn a").hover(
			function() {
				$(".menu_wrap_btn a").css({
					color: '#000',
					background: '#fff'
				});
			},
			function() {
				$(".menu_wrap_btn a").css({
					color: '#fff',
					background: 'transparent'
				});
			}
		);

		$(".magazine_detail_btn a").hover(
			function() {
				$(".magazine_detail_btn a").css({
					background: 'url(img/contents/btn_magazine_pc.png) 0 -17px no-repeat'
				});
				$(".magazine_detail_btn").css({
					background: 'rgb(151,109,63)'
				});
			},
			function() {
				$(".magazine_detail_btn a").css({
					background: 'url(img/contents/btn_magazine_pc.png) 0 0 no-repeat'
				});
				$(".magazine_detail_btn").css({
					background: 'transparent'
				});
			}
		);
	});

	$(function() {
		/*fadeIn*/
		//메인비주얼
		$(".set_02").animateCSS('fadeIn', { duration: 800 });
		$(".set_03").animateCSS('fadeIn', { duration: 800, delay: 500 });
		$(".set_05").animateCSS('fadeIn', { duration: 800, delay: 1000 });
		$(".set_06").animateCSS('fadeIn', { duration: 800, delay: 1500 });
		$(".set_04").animateCSS('fadeIn', { duration: 800, delay: 2000 });
		$(".set_01").animateCSS('fadeIn', { duration: 800, delay: 2500 });
		$(".set_07").animateCSS('fadeIn', { duration: 800, delay: 3000 });
		$(".main_visual_slogan img").animateCSS('fadeIn', { duration: 800, delay: 3500 });
		$(".slogan_btn").animateCSS('fadeIn', { duration: 800, delay: 4000 });
		//리서브
		$(".reserve_visual").animateCSS('fadeIn', { duration: 2000 });
		$(".reserve_ttl").animateCSS('fadeIn', { duration: 2000, delay: 500 });
		$(".reserve_detail_btn").animateCSS('fadeIn', { duration: 2000, delay: 1000 });
		//매장랩
		$(".store_exp_img01").animateCSS('fadeIn', { duration: 800 });
		$(".store_exp_img02").animateCSS('fadeIn', { duration: 800 });
		//메뉴랩
		$(".menu_wrap_btn").animateCSS('fadeIn', { duration: 2200 });

		/*fadeInLeft&Right*/
		//메인빈
		$(".bean_img_box").animateCSS('fadeInLeft', { duration: 1500, delay: 600 });
		$(".bean_txt_box").animateCSS('fadeInRight', { duration: 1500, delay: 600 });
		//메뉴랩
		$(".menu_wrap_txt01").animateCSS('fadeInLeft', { duration: 2200, delay: 600 });
		$(".menu_wrap_txt02").animateCSS('fadeInLeft', { duration: 2200, delay: 600 });
		//리저브 매거진
		$(".magazine_right").animateCSS('fadeInRight', { duration: 2200, delay: 600 });
		$(".magazine_detail_btn").animateCSS('fadeInRight', { duration: 2200, delay: 1500 });
		//매장랩
		$(".store_txt01").animateCSS('fadeInRight', { duration: 2000, delay: 600 });
		$(".store_txt02").animateCSS('fadeInRight', { duration: 2900, delay: 600 });
		$(".store_btn").animateCSS('fadeInRight', { duration: 2400, delay: 1600 });
	});

	$(window).on('mousewheel', function(e) {
		var wheel = e.originalEvent.wheelDelta;
		var sHeight = $(document).scrollTop();

		if (wheel <= 0) { //scroll 내렸을 때
			if (sHeight >= 0) {
				//메인빈
				$(".bean_img_box").animateCSS('fadeInLeft', { duration: 1500 });
				$(".bean_txt_box").animateCSS('fadeInRight', { duration: 1500 });
			}
		}
	});

	$(window).on('mousewheel', function(e) {
		var wheel = e.originalEvent.wheelDelta;
		var sHeight = $(document).scrollTop();

		if (wheel <= 0) { //scroll 내렸을 때
			if (sHeight >= 0) {
				//메뉴랩
				$(".menu_wrap_txt01").animateCSS('fadeInLeft', { duration: 2200 });
				$(".menu_wrap_txt02").animateCSS('fadeInLeft', { duration: 2200 });
			}
		}
	});

	$(".menu_wrap, .reserve, .main_bean, .s_rewards, .main_visual, .prom_banner, .line_notice, #header").on('mousewheel', function(e) {
		var wheel = e.originalEvent.wheelDelta;
		var sHeight = $(document).scrollTop();

		if (wheel <= 0) { //scroll 내렸을 때
			if (sHeight >= 0) {
				//리저브 매거진
				$(".magazine_right").animateCSS('fadeInRight', { duration: 2200 });
				$(".magazine_detail_btn").animateCSS('fadeInRight', { duration: 3200 });
				//매장랩
				$(".store_txt01").animateCSS('fadeInRight', { duration: 2000 });
				$(".store_txt02").animateCSS('fadeInRight', { duration: 2900 });
				$(".store_btn").animateCSS('fadeInRight', { duration: 3400 });
			}
		}
	});

	$('.news_result').slick({
		slidesToShow: 1,
		slidesToScroll: 1,
		autoplay: true,
		autoplaySpeed: 2000,
		vertical: true
	});


	$('.prom_slider_list').slick({
		slidesToShow: 1,
		slidesToScroll: 1,
		autoplay: true,
		autoplaySpeed: 2000,
		dots: true
	});

	$(".prom_btn").on('click', function(e) {
		e.preventDefault();
		$(".prom_btn img").toggleClass('open close');
		$(".prom_banner").slideToggle();
	});
	
	$(".prom_btn .open").on('click', function() {
		$(".prom_btn img").attr('src','img/contents/btn_prom_down.png');
	});
	$(".prom_btn .close").on('click', function() {
		$(".prom_btn img").attr('src','img/contents/btn_prom_up.png');
	});

});
