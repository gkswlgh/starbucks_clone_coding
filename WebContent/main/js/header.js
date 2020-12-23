/**
 * header : 메뉴바
 */

$(function() {
	/*gnb_sub:hover*/
	$(".gnb_nav_inner>ul>li").mouseenter(function() {
		if ($(".gnb_sub_wrap").is(":visible")) {
			$(".gnb_sub_wrap").hide();
			$(this).find(".gnb_sub_wrap").slideDown(300);
		} else {
			$(this).find(".gnb_sub_wrap").slideDown(300);
		}
		$(this).find("h2>a").addClass("on");
	});
	$(".gnb_nav_inner>ul>li").mouseleave(function() {
		if ($(".gnb_sub_wrap").is(":visible")) {
			$(this).find(".gnb_sub_wrap").slideUp(200);
		}
		$(this).find("h2>a").removeClass("on");
	});

	/*btn_search:click*/
	$(".btn_search").click(function() {
		$(this).attr("style", "background:#fff; width:180px;");
		$(this).find("input").attr("style", "display:inline-block;");
		$(".util_nav").attr("style", "right:232px;");
	});
});