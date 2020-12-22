/**
 * header : 메뉴바
 */

$(function() {
	/*gnb_sub:hover*/
	$(".gnb_nav_inner>ul>li").hover(function() {
		$(this).find(".gnb_sub_wrap").slideToggle(300);
	});
	$(".gnb_nav_inner>ul>li").mouseenter(function() {
		$(this).find("h2>a").addClass("on");
	});
	$(".gnb_nav_inner>ul>li").mouseleave(function() {
		$(this).find("h2>a").removeClass("on");
	});

	/*btn_search:click*/
	$(".btn_search").click(function() {
		$(this).attr("style", "background:#fff; width:180px;");
		$(this).find("input").attr("style", "display:inline-block;");
		$(".util_nav").attr("style", "right:232px;");
	});
});