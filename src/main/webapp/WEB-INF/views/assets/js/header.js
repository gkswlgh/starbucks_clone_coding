/**
 * header : 메뉴바
 */


$(function() {
	/*변수*/
	//header
	var $gnb = $('.gnb_nav').find('li');
	var $subNav = $('.gnb_nav').find('.gnb_sub_wrap');



	/*btn_search:click*/
	$(".btn_search").click(function() {
		$(this).attr("style", "background:#fff; width:180px;");
		$(this).find("input").attr("style", "display:inline-block;");
		$(".util_nav").attr("style", "right:232px;");
	});

	//gnb_subNav
	$gnb.on('mouseover', function(e) {
		$gnb.find("h2>a").removeClass('on');
		$(this).find("h2>a").addClass('on');

		var $thisSubNav = $(this).find('.gnb_sub_wrap');
		$subNav.removeClass('on');
		$thisSubNav.stop().slideDown(200);

	}).on('mouseout', function(e) {
		$gnb.find("h2>a").removeClass('on');

		var $thisSubNav = $(this).find('.gnb_sub_wrap');
		$thisSubNav.stop().slideUp(200);
	});
});